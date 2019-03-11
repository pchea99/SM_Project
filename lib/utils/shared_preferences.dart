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
    User user = User.fromJson(json.decode(prefs.getString('user')));
    return user;
  }
}