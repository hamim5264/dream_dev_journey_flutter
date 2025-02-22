import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_pre_practice/task_manager_practice/components/app_bottom_nav.dart';
import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_pre_practice/task_manager_practice/components/cancel_task_list.dart';
import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_pre_practice/task_manager_practice/components/completed_task_list.dart';
import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_pre_practice/task_manager_practice/components/new_task_list.dart';
import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_pre_practice/task_manager_practice/components/progress_task_list.dart';
import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_pre_practice/task_manager_practice/components/task_app_bar.dart';
import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_pre_practice/task_manager_practice/utility/task_utilities.dart';
import 'package:flutter/material.dart';

class TaskMainHomeScreen extends StatefulWidget {
  const TaskMainHomeScreen({super.key});

  @override
  State<TaskMainHomeScreen> createState() => _TaskMainHomeScreenState();
}

class _TaskMainHomeScreenState extends State<TaskMainHomeScreen> {
  int tabIndex = 0;

  Map<String, String> profileData = {
    "email": "",
    "firstName": "",
    "lastName": "",
    "photo": defaultProfilePic,
  };

  readAppBarData() async {
    String? email = await readUserData("email");
    String? firstName = await readUserData("firstName");
    String? lastName = await readUserData("lastName");
    String? img = await readUserData("photo");

    setState(() {
      profileData = {
        "email": '$email',
        "firstName": '$firstName',
        "lastName": '$lastName',
        "photo": defaultProfilePic
      };
    });
  }

  @override
  void initState() {
    readAppBarData();
    super.initState();
  }

  onItemTapped(int index) {
    setState(() {
      tabIndex = index;
    });
  }

  final widgetOptions = [
    NewTaskList(),
    ProgressTaskList(),
    CompletedTaskList(),
    CancelTaskList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: taskAppBar(context, profileData),
      body: widgetOptions.elementAt(tabIndex),
      bottomNavigationBar: appBottomNav(tabIndex, onItemTapped),
    );
  }
}
