import 'dart:convert';

import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/task_manager_with_getx/data/models/log_in_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthUtility {
  AuthUtility._();

  static LoginModel userInfo = LoginModel();

  static Future<LoginModel> getUserInfo() async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String value = sharedPrefs.getString('user-data')!;

    return LoginModel.fromJson(jsonDecode(value));
  }

  static Future<void> saveUserInfo(LoginModel model) async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setString('user-data', jsonEncode(model.toJson()));

    userInfo = model;
  }

  static Future<void> updateUserInfo(UserData userData) async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    userInfo.data = userData;
    await sharedPrefs.setString('user-data', jsonEncode(userInfo.toJson()));
  }

  static Future<void> clearUserInfo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  static Future<bool> isUserLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool isLoggedIn = sharedPreferences.containsKey('user-data');
    if (isLoggedIn) {
      userInfo = await getUserInfo();
    }
    return isLoggedIn;
  }
}
