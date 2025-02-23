import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_pre_practice/task_manager_practice/api/api_clients.dart';
import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_pre_practice/task_manager_practice/components/task_list.dart';
import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_pre_practice/task_manager_practice/style/task_styles.dart';
import 'package:flutter/material.dart';

class ProgressTaskList extends StatefulWidget {
  const ProgressTaskList({super.key});

  @override
  State<ProgressTaskList> createState() => _ProgressTaskListState();
}

class _ProgressTaskListState extends State<ProgressTaskList> {
  List taskItems = [];
  bool isLoading = true;
  String status = "Progress";

  @override
  void initState() {
    super.initState();
    callData();
  }

  callData() async {
    var data = await taskListByStatusRequest("Progress");
    setState(() {
      isLoading = false;
      taskItems = data;
    });
  }

  updateStatus(id) async {
    setState(() {
      isLoading = true;
    });
    await taskStatusUpdateRequest(id, status);
    await callData();
    setState(() {
      status = "Progress";
    });
  }

  deleteTaskItem(id) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Delete!",
            ),
            content: Text(
              "Once delete, you cant get it back.",
            ),
            actions: [
              OutlinedButton(
                onPressed: () async {
                  Navigator.pop(context);
                  setState(() {
                    isLoading = true;
                  });
                  await taskDeleteRequest(id);
                  await callData();
                },
                child: Text(
                  "Yes",
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "No",
                ),
              ),
            ],
          );
        });
  }

  statusChange(id) async {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (BuildContext context, StateSetter) {
            return Container(
              padding: EdgeInsets.all(30),
              height: 360,
              child: Column(
                children: [
                  RadioListTile(
                    title: Text(
                      "New",
                    ),
                    value: "New",
                    groupValue: status,
                    onChanged: (value) {
                      setState(() {
                        status = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text(
                      "Progress",
                    ),
                    value: "Progress",
                    groupValue: status,
                    onChanged: (value) {
                      setState(() {
                        status = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text(
                      "Completed",
                    ),
                    value: "Completed",
                    groupValue: status,
                    onChanged: (value) {
                      setState(() {
                        status = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text(
                      "Cancelled",
                    ),
                    value: "Cancelled",
                    groupValue: status,
                    onChanged: (value) {
                      setState(() {
                        status = value.toString();
                      });
                    },
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        updateStatus(id);
                      },
                      style: taskAppButtonStyle(),
                      child: Text(
                        "Confirm",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
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
            child: taskListView(taskItems, deleteTaskItem, statusChange),
          );
  }
}
