import 'package:sm_app/model_dto/user.dart';

abstract class LoginPageContract {
  void onLoginSuccess(User user);
  void onLoginError(String error);
}

class LoginPagePresenter {
  LoginPageContract _view;
  LoginPagePresenter(this._view);

  doLogin(String username, String password) {
    if(username == "admin" && password == "123"){
      User user = new User()
        ..userNo = "admin"
        ..password = "123";
      _view.onLoginSuccess(user);
    }else{
      _view.onLoginError("error");
    }
  }
}