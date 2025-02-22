import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_pre_practice/task_manager_practice/api/api_clients.dart';
import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_pre_practice/task_manager_practice/components/task_list.dart';
import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_pre_practice/task_manager_practice/style/task_styles.dart';
import 'package:flutter/material.dart';

class CancelTaskList extends StatefulWidget {
  const CancelTaskList({super.key});

  @override
  State<CancelTaskList> createState() => _CancelTaskListState();
}

class _CancelTaskListState extends State<CancelTaskList> {
  List taskItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    callData();
  }

  callData() async {
    var data = await taskListByStatusRequest("Cancelled");
    setState(() {
      isLoading = false;
      taskItems = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? (Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          ))
        : RefreshIndicator(
            color: colorGreen,
            onRefresh: () async {
              await callData();
            },
            child: taskListView(taskItems),
          );
  }
}
