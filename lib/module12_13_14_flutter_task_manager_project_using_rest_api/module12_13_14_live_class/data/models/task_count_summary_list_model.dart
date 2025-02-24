import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_live_class/data/models/task_count.dart';

class TaskCountSummaryListModel {
  String? status;
  List<TaskCount>? taskCountList;

  TaskCountSummaryListModel({this.status, this.taskCountList});

  TaskCountSummaryListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      taskCountList = <TaskCount>[];
      json['data'].forEach((v) {
        taskCountList!.add(TaskCount.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.taskCountList != null) {
      data['data'] = this.taskCountList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
