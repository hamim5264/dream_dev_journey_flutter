import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_pre_practice/task_manager_practice/style/task_styles.dart';
import 'package:flutter/material.dart';

ListView taskListView(taskItems, deleteTaskItem, statusChange) {
  return ListView.builder(
      itemCount: taskItems.length,
      itemBuilder: (context, index) {
        Color statusColor = colorGreen;
        if (taskItems[index]["status"] == "New") {
          statusColor = colorBlue;
        } else if (taskItems[index]["status"] == "Progress") {
          statusColor = colorOrange;
        } else if (taskItems[index]["status"] == "Cancelled") {
          statusColor = colorRed;
        }

        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            color: Colors.white,
            child: taskItemSizedBox(
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskItems[index]["title"],
                    style: head6Text(
                      colorDarkBlue,
                    ),
                  ),
                  Text(
                    taskItems[index]["description"],
                    style: head7Text(
                      colorLightGray,
                    ),
                  ),
                  Text(
                    taskItems[index]["createdDate"],
                    style: head8Text(
                      colorLightGray,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      statusChild(taskItems[index]["status"], statusColor),
                      SizedBox(
                        width: 120,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 50,
                            height: 30,
                            child: ElevatedButton(
                              onPressed: () {
                                statusChange(taskItems[index]["_id"]);
                              },
                              style: appStatusButtonStyle(colorGreen),
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 50,
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () {
                            deleteTaskItem(taskItems[index]["_id"]);
                          },
                          style: appStatusButtonStyle(colorRed),
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
