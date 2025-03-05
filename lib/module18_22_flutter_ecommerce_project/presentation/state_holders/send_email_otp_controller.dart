import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/data/models/response_data.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/data/services/network_caller.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/data/utility/urls.dart';
import 'package:get/get.dart';

class SendEmailOtpController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;
  String _errorMessage = "";

  String get errorMessage => _errorMessage;

  String _lastSentEmail = "";

  String get lastSentEmail => _lastSentEmail;

  Future<bool> sendOtpToEmail(String email) async {
    _lastSentEmail = email;
    _inProgress = true;
    update();
    final ResponseData response =
        await NetworkCaller().getRequest(Urls.sendEmailOtp(email));
    _inProgress = false;
    if (response.isSuccess) {
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}
