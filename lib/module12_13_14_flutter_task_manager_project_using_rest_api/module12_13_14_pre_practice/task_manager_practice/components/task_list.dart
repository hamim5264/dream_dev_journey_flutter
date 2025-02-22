import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_pre_practice/task_manager_practice/style/task_styles.dart';
import 'package:flutter/material.dart';

ListView taskListView(taskItems) {
  return ListView.builder(
      itemCount: taskItems.length,
      itemBuilder: (context, index) {
        return Card(
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
                )
              ],
            ),
          ),
        );
      });
}
