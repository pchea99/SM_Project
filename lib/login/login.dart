import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sm_app/login/login-presenter.dart';
import 'package:sm_app/login/login-service.dart';
import 'package:sm_app/menu/menu.dart';
import 'package:sm_app/model_dto/user.dart';
import 'package:sm_app/res/font-size-res.dart';
import 'package:sm_app/res/string-res.dart';
import 'package:sm_app/utils/navigate-to.dart';
import 'package:sm_app/utils/spinner-dialog.dart';

User sharedUser;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> implements LoginView {
  LoginPresenter _loginPresenter;
  User _user;
  String _errorMsg = "";
  Map<String, FocusNode> _focus;

  @override
  void initState() {
    super.initState();
  }

  _LoginState(){
    _loginPresenter = new LoginPresenter(this);
    _user = new User();
    _focus = new Map();
  }

  Widget lblTitle(){
    return Text(
      StringRes.labelLogin,
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
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      onChanged: (position){
        _user.position = position;
      },
    );
  }

  Widget txtUsername(){
    return TextField(
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
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      onChanged: (username){
        _user.firstName = username;
      },
    );
  }

  Widget txtPassword(){
    return TextField(
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
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      onChanged: (password){
        _user.password = password;
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
        _errorMsg,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        padding: const EdgeInsets.only(
          top: 115.0,
          left: 8.0,
          right: 8.0
        ),
        shrinkWrap: true,
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
    );
  }

  @override
  void onLoginError(String error) {
    _errorMsg = error;
    onSetSate();
  }

  @override
  void onLoginSuccess(String msg) {
    SpinnerDialog.onSpinner(context);
    LoginService.getUserLogin(_user.firstName.trim().toLowerCase().replaceAll(" ", '')
        +"-"+_user.password).then((userDB) async {
      if(userDB.position == _user.position && userDB.password == _user.password){
        sharedUser = userDB;
        await NavigateTo.navigateTo(context: context, route: Menu());
        exit(0);
      }
      Navigator.pop(context);
    }).catchError((err){
      print("err: $err");
      Navigator.pop(context);
    });
  }

  @override
  void onPassword(String error) {
    var fpwd = FocusNode();
    FocusScope.of(context).requestFocus(fpwd);
    clearFocus();
    _focus['pwd'] = fpwd;
    _errorMsg = error;
    onSetSate();
  }

  @override
  void onPositionError(String error) {
    var fpos = FocusNode();
    FocusScope.of(context).requestFocus(fpos);
    _errorMsg = error;
    clearFocus();
    _focus['pos'] = fpos;
    onSetSate();
  }

  @override
  void onUserNameError(String error) {
    var fun = FocusNode();
    FocusScope.of(context).requestFocus(fun);
    clearFocus();
    _focus['un'] = fun;
    _errorMsg = error;
    onSetSate();
  }

  void clearFocus() {
    if(_focus['un'] != null) {
      _focus['un'].unfocus();
    }
    if(_focus['pos'] != null) {
      _focus['pos'].unfocus();
    }
    if(_focus['pwd'] != null) {
      _focus['pwd'].unfocus();
    }
  }

  void submit() {
    _errorMsg = "";
    clearFocus();
    _loginPresenter.doLogin(_user.firstName, _user.password, _user.position);
  }

  void onSetSate(){
    if(!mounted){
      return;
    }

    setState(() {});
  }
}
