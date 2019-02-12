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

  _LoginState(){
    _loginPresenter = new LoginPresenter(this);
    _user = new User();
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
    );
  }

  Widget _txtUsername(){
    return TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
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
    );
  }

  Widget _txtPassword(){
    return TextFormField(
      keyboardType: TextInputType.text,
      obscureText: true,
      autofocus: false,
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
            _btnLogin()
          ],
        ),
      ),
    );
  }

  @override
  void onLoginError(String error) {
    // TODO: implement onLoginError
  }

  @override
  void onLoginSuccess(String msg) {
    // TODO: implement onLoginSuccess
  }

  @override
  void onPassword(String error) {
    // TODO: implement onPassword
  }

  @override
  void onPositionError(String error) {
    // TODO: implement onPositionError
  }

  @override
  void onUserNameError(String error) {
    // TODO: implement onUserNameError
  }

  void _submit() {

  }
}
