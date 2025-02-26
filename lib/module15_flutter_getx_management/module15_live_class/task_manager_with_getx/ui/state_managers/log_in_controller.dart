import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/task_manager_with_getx/data/models/log_in_model.dart';
import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/task_manager_with_getx/data/models/network_response.dart';
import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/task_manager_with_getx/data/services/network_caller.dart';
import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/task_manager_with_getx/data/utilities/auth_utility.dart';
import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/task_manager_with_getx/data/utilities/urls.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<bool> loginUser(String email, String password) async {
    _isLoading = true;
    update();

    Map<String, dynamic> requestBody = {"email": email, "password": password};
    final NetworkResponse response = await NetworkCaller()
        .postRequest(Urls.loginUrl, requestBody, onLoginScreen: true);

    _isLoading = false;
    update();

    if (response.isSuccess) {
      LoginModel loginModel = LoginModel.fromJson(response.body!);
      await AuthUtility.saveUserInfo(loginModel);

      return true;
    } else {
      return false;
    }
  }
}
