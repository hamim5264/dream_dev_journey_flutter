import 'dart:convert';

import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/task_manager_with_getx/data/models/network_response.dart';
import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/task_manager_with_getx/data/models/task_status_count_model.dart';
import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/task_manager_with_getx/data/services/network_caller.dart';
import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/task_manager_with_getx/data/utilities/task_status.dart';
import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/task_manager_with_getx/data/utilities/urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskSummaryController extends GetxController {
  bool _isLoading = false;
  int newTaskCount = 0,
      progressTaskCount = 0,
      completedTaskCount = 0,
      canceledTaskCount = 0;

  bool get isLoading => _isLoading;

  Future<bool> getTaskStatusCount() async {
    newTaskCount = 0;
    progressTaskCount = 0;
    completedTaskCount = 0;
    canceledTaskCount = 0;

    _isLoading = true;
    update();

    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.taskStatusCountUrl);

    _isLoading = false;

    if (response.isSuccess) {
      Map<String, dynamic> decodedResponse =
          jsonDecode(jsonEncode(response.body));
      List<TaskCountModel> taskStatusAndCountList =
          (decodedResponse['data'] as List)
              .map((data) => TaskCountModel.fromJson(data))
              .toList();

      for (var task in taskStatusAndCountList) {
        switch (task.sId) {
          case TaskStatus.newTask:
            newTaskCount = task.sum ?? 0;
            break;
          case TaskStatus.progressTask:
            progressTaskCount = task.sum ?? 0;
            break;
          case TaskStatus.completedTask:
            completedTaskCount = task.sum ?? 0;
            break;
          case TaskStatus.canceledTask:
            canceledTaskCount = task.sum ?? 0;
            break;
        }
      }
      update();
      return true;
    } else {
      Get.snackbar('Failed', 'Tasks status count failed!',
          backgroundColor: Colors.red, colorText: Colors.white);
      update();
      return false;
    }
  }
}
