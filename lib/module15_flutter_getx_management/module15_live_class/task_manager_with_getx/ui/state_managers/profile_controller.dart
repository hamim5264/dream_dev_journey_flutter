import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/task_manager_with_getx/data/models/network_response.dart';
import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/task_manager_with_getx/data/services/network_caller.dart';
import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/task_manager_with_getx/data/utilities/urls.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<bool> updateProfile(
      String fName, String lName, String mobile, String photo) async {
    _isLoading = true;
    update();

    Map<String, dynamic> requestBody = {
      // "email": AuthUtility.userInfo.data!.email,
      "firstName": fName,
      "lastName": lName,
      "mobile": mobile,
      "photo": photo
    };
    final NetworkResponse response =
        await NetworkCaller().postRequest(Urls.profileUpdateUrl, requestBody);

    _isLoading = false;
    update();

    if (response.isSuccess) {
      Get.back();
      update();
      return true;
    } else {
      return false;
    }
  }
}
