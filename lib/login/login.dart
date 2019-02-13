import 'package:flutter/material.dart';
import 'package:sm_app/login/mvp-login/login-presenter.dart';
import 'package:sm_app/model_dto/user.dart';
import 'package:sm_app/res/font-size-res.dart';
import 'package:sm_app/res/string-res.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> implements LoginView {
  LoginPresenter _loginPresenter;
  User _user;
  String _error = "";
  Map _focus;
  FocusNode _myFocusNode;

  _LoginState(){
    _loginPresenter = new LoginPresenter(this);
    _user = new User();
    _focus = new Map();
    _myFocusNode = FocusNode();
  }

  Widget _lblTitle(){
    return Text(
      StringRes.login,
      style: TextStyle(
        color: Colors.teal,
        fontSize: FontSizeRes.title,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _btnLogin(){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: _submit,
        padding: EdgeInsets.all(12),
        color: Colors.teal,
        child: Text(
            StringRes.login,
            style: TextStyle(
              color: Colors.white,
              fontSize: FontSizeRes.button
            )
        ),
      ),
    );
  }

  Widget _txtPosition(){
    return TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      focusNode: _focus['pos'],
      style: TextStyle(
          fontSize: FontSizeRes.normal
      ),
      decoration: InputDecoration(
        hintText: StringRes.position,
        hintStyle: TextStyle(
          fontSize: FontSizeRes.normal
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      onSaved: (position){
        _user.position = position;
      },
    );
  }

  Widget _txtUsername(){
    return TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      focusNode: _focus['un'],
      style: TextStyle(
          fontSize: FontSizeRes.normal
      ),
      decoration: InputDecoration(
        hintStyle: TextStyle(
            fontSize: FontSizeRes.normal
        ),
        hintText: StringRes.username,
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      onSaved: (username){
        _user.userNo = username;
      },
    );
  }

  Widget _txtPassword(){
    return TextFormField(
      keyboardType: TextInputType.text,
      obscureText: true,
      autofocus: false,
      focusNode: _focus['pwd'],
      style: TextStyle(
        fontSize: FontSizeRes.normal
      ),
      decoration: InputDecoration(
        hintStyle: TextStyle(
            fontSize: FontSizeRes.normal
        ),
        hintText: StringRes.password,
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      onSaved: (password){
        _user.password = password;
      },
    );
  }

  Widget _lblCopyRight(){
    return Text(
      StringRes.copyRight,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: FontSizeRes.small,
      ),
    );
  }

  Widget _lblError(){
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        _error,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            _lblTitle(),
            SizedBox(height: 48.0),
            _txtUsername(),
            SizedBox(height: 8.0),
            _txtPassword(),
            SizedBox(height: 8.0),
            _txtPosition(),
            SizedBox(height: 24.0),
            _btnLogin(),
            _lblCopyRight(),
            _lblError()
          ],
        ),
      ),
    );
  }

  @override
  void onLoginError(String error) {
    _error = error;
    _onSetSate();
  }

  @override
  void onLoginSuccess(String msg) {
    // TODO: implement onLoginSuccess
  }

  @override
  void onPassword(String error) {
    FocusScope.of(context).requestFocus(_myFocusNode);
    _focus['pwd'] = _myFocusNode;
    _error = error;
    _onSetSate();
  }

  @override
  void onPositionError(String error) {
    _error = error;
    _focus['pos'] = true;
    _onSetSate();
  }

  @override
  void onUserNameError(String error) {
    FocusScope.of(context).requestFocus(_myFocusNode);
    _focus['un'] = _myFocusNode;
    _error = error;
    _onSetSate();
  }

  void _submit() {
    _error = "";
    _focus.clear();
    _loginPresenter.doLogin(_user.userNo, _user.password, _user.position);
  }

  void _onSetSate(){
    if(!mounted){
      return;
    }

    setState(() {});
  }
}
