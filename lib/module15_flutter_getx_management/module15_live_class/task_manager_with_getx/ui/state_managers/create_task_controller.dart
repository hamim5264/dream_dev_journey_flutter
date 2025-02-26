import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/task_manager_with_getx/data/models/network_response.dart';
import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/task_manager_with_getx/data/services/network_caller.dart';
import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/task_manager_with_getx/data/utilities/urls.dart';
import 'package:get/get.dart';

class CreateTaskController extends GetxController {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<bool> createTask(
      String title, String description, String status) async {
    _isLoading = true;
    update();

    Map<String, dynamic> requestBody = {
      "title": title,
      "description": description,
      "status": status
    };
    final NetworkResponse response =
        await NetworkCaller().postRequest(Urls.createTaskUrl, requestBody);

    _isLoading = false;
    update();

    if (response.isSuccess) {
      return true;
    } else {
      return false;
    }
  }
}
