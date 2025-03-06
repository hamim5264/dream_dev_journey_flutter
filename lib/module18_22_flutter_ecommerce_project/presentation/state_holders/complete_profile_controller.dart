import 'dart:developer';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/data/models/complete_profile_model.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/data/models/create_profile_params.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/data/services/network_caller.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/data/utility/urls.dart';

class CompleteProfileController extends GetxController {
  bool _inProgress = false;

  String _errorMessage = "";

  CompleteProfileModel _completeProfileModel = CompleteProfileModel();

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  CompleteProfileModel get completeProfileModel => CompleteProfileModel();

  Future<bool> createProfileData(
      String token, CreateProfileParams params) async {
    _inProgress = true;
    update();
    final response = await NetworkCaller()
        .postRequest(Urls.createProfile, token: token, body: params.toJson());
    log(token);
    _inProgress = false;
    if (response.isSuccess) {
      _completeProfileModel =
          CompleteProfileModel.fromJson(response.responseData["data"]);
      await Get.find<AuthController>()
          .saveUserDetails(token, null, _completeProfileModel);
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}
