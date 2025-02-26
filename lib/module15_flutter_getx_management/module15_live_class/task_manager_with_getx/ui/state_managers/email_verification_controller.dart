import 'dart:convert';

import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/task_manager_with_getx/data/models/network_response.dart';
import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/task_manager_with_getx/data/services/network_caller.dart';
import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/task_manager_with_getx/data/utilities/urls.dart';
import 'package:get/get.dart';

class EmailVerificationController extends GetxController {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<bool> sendPinToEmail(String email) async {
    _isLoading = true;
    update();

    final String responseUrl = Urls.recoveryEmailUrl(email);
    final NetworkResponse response =
        await NetworkCaller().getRequest(responseUrl);

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
