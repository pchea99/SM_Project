import 'package:flutter/material.dart';
import 'package:sm_app/login/login-presenter.dart';
import 'package:sm_app/model_dto/user.dart';
import 'package:sm_app/res/font-size-res.dart';
import 'package:sm_app/res/string-res.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> implements LoginView {
  LoginPresenter loginPresenter;
  User user;
  String errorMsg = "";
  Map<String, FocusNode> focus;

  _LoginState(){
    loginPresenter = new LoginPresenter(this);
    user = new User();
    focus = new Map();
  }

  Widget lblTitle(){
    return Text(
      StringRes.login,
      style: TextStyle(
        color: Colors.teal,
        fontSize: FontSizeRes.title,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget btnLogin(){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        onPressed: submit,
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

  Widget txtPosition(){
    return TextField(
      keyboardType: TextInputType.text,
      autofocus: false,
      focusNode: focus['pos'],
      style: TextStyle(
          fontSize: FontSizeRes.normal
      ),
      decoration: InputDecoration(
        hintText: StringRes.position,
        hintStyle: TextStyle(
          fontSize: FontSizeRes.normal
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      onChanged: (position){
        user.position = position;
      },
    );
  }

  Widget txtUsername(){
    return TextField(
      keyboardType: TextInputType.text,
      autofocus: false,
      focusNode: focus['un'],
      style: TextStyle(
          fontSize: FontSizeRes.normal
      ),
      decoration: InputDecoration(
        hintStyle: TextStyle(
            fontSize: FontSizeRes.normal
        ),
        hintText: StringRes.username,
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      onChanged: (username){
        user.userNo = username;
      },
    );
  }

  Widget txtPassword(){
    return TextField(
      keyboardType: TextInputType.text,
      obscureText: true,
      autofocus: false,
      focusNode: focus['pwd'],
      style: TextStyle(
        fontSize: FontSizeRes.normal
      ),
      decoration: InputDecoration(
        hintStyle: TextStyle(
            fontSize: FontSizeRes.normal
        ),
        hintText: StringRes.password,
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      onChanged: (password){
        user.password = password;
      },
    );
  }

  Widget lblCopyRight(){
    return Text(
      StringRes.copyRight,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: FontSizeRes.small,
      ),
    );
  }

  Widget lblError(){
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        errorMsg,
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
            lblTitle(),
            SizedBox(height: 48.0),
            txtUsername(),
            SizedBox(height: 8.0),
            txtPassword(),
            SizedBox(height: 8.0),
            txtPosition(),
            SizedBox(height: 24.0),
            btnLogin(),
            lblCopyRight(),
            lblError()
          ],
        ),
      ),
    );
  }

  @override
  void onLoginError(String error) {
    errorMsg = error;
    onSetSate();
  }

  @override
  void onLoginSuccess(String msg) {
    // TODO: implement onLoginSuccess
  }

  @override
  void onPassword(String error) {
    var fpwd = FocusNode();
    FocusScope.of(context).requestFocus(fpwd);
    clearFocus();
    focus['pwd'] = fpwd;
    errorMsg = error;
    onSetSate();
  }

  @override
  void onPositionError(String error) {
    var fpos = FocusNode();
    FocusScope.of(context).requestFocus(fpos);
    errorMsg = error;
    clearFocus();
    focus['pos'] = fpos;
    onSetSate();
  }

  @override
  void onUserNameError(String error) {
    var fun = FocusNode();
    FocusScope.of(context).requestFocus(fun);
    clearFocus();
    focus['un'] = fun;
    errorMsg = error;
    onSetSate();
  }

  void clearFocus() {
    if(focus['un'] != null) {
      focus['un'].unfocus();
    }
    if(focus['pos'] != null) {
      focus['pos'].unfocus();
    }
    if(focus['pwd'] != null) {
      focus['pwd'].unfocus();
    }
  }

  void submit() {
    errorMsg = "";
    clearFocus();
    loginPresenter.doLogin(user.userNo, user.password, user.position);
  }

  void onSetSate(){
    if(!mounted){
      return;
    }

    setState(() {});
  }
}
