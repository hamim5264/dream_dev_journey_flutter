import 'dart:convert';

import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/data/models/complete_profile_model.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/data/models/read_profile_data.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/presentation/ui/screens/auth/verify_email_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  static String? token;
  CompleteProfileModel? completeProfileModel;
  ReadProfileModel? readProfileData;

  Future<void> saveUserDetails(
      String t, ReadProfileModel? p, CompleteProfileModel? cp) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("token", t);
    await sharedPreferences.setString("readProfile", jsonEncode(p?.toJson()));
    await sharedPreferences.setString(
        "completeProfile", jsonEncode(cp?.toJson()));
    token = t;
    readProfileData = p;
    completeProfileModel = cp;
  }

  Future<void> initialize() async {
    token = await _getToken();
    readProfileData = await _getProfile();
    completeProfileModel = await _getCompleteProfile();
  }

  Future<bool> isLoggedIn() async {
    await initialize();
    return token != null;
  }

  bool get isTokenNotNull => token != null;

  Future<String?> _getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString("token");
  }

  Future<ReadProfileModel?> _getProfile() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? strProfile = sharedPreferences.getString("readProfile");
    final bool result = strProfile.toString() == null.toString();

    if (result) {
      return null;
    } else {
      return ReadProfileModel.fromJson(jsonDecode(strProfile!));
    }
  }

  Future<CompleteProfileModel?> _getCompleteProfile() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? strProfile = sharedPreferences.getString("completeProfile");
    final bool result = strProfile.toString() == null.toString();
    if (result) {
      return null;
    } else {
      return CompleteProfileModel.fromJson(jsonDecode(strProfile!));
    }
  }

  static Future<void> clearAuthData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    token = null;
  }

  static Future<void> goToLogin() async {
    Get.to(() => const VerifyEmailScreen());
  }
}
