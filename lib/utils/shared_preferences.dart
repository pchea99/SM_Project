import 'dart:convert';

import 'package:sm_app/model_dto/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceUtils{
  static void setUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user', json.encode(user.toJson()));
  }

  static Future getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJson = prefs.getString('user');
    if(userJson == null){
      return null;
    }

    User user = User.fromJson(json.decode(userJson));
    return user;
  }

  static void clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}