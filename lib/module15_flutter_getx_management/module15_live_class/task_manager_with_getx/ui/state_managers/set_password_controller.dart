import 'dart:convert';

import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/task_manager_with_getx/data/models/network_response.dart';
import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/task_manager_with_getx/data/services/network_caller.dart';
import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/task_manager_with_getx/data/utilities/urls.dart';
import 'package:get/get.dart';

class SetPasswordController extends GetxController {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<bool> postNewPassword(
      String email, String otp, String password) async {
    _isLoading = true;
    update();

    Map<String, dynamic> requestBody = {
      "email": email,
      "OTP": otp,
      "password": password
    };
    final NetworkResponse response =
        await NetworkCaller().postRequest(Urls.setPasswordUrl, requestBody);
    Map<String, dynamic> decodedResponse =
        jsonDecode(jsonEncode(response.body));

    _isLoading = false;
    update();

    if (response.isSuccess) {
      if (decodedResponse['status'] == 'success') {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
