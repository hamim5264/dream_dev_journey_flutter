import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_pre_practice/task_manager_practice/style/task_styles.dart';
import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_pre_practice/task_manager_practice/utility/task_utilities.dart';
import 'package:flutter/material.dart';

AppBar taskAppBar(context, profileData) {
  return AppBar(
    backgroundColor: colorGreen,
    flexibleSpace: Container(
      margin: const EdgeInsets.fromLTRB(10, 40, 10, 0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 20,
            child: ClipOval(
              child: Image.memory(showBase64Image(profileData["photo"])),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/profileScreen");
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${profileData['firstName']} ${profileData['lastName']}",
                  style: head7Text(colorWhite),
                ),
                Text(
                  profileData["email"],
                  style: head8Text(colorWhite),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, "/taskCreate");
        },
        icon: const Icon(
          Icons.add_circle,
          color: Colors.white,
          size: 28,
        ),
      ),
      IconButton(
        onPressed: () async {
          await removeToken();
          Navigator.pushNamedAndRemoveUntil(
              context, "/login", (route) => false);
        },
        icon: const Icon(
          Icons.logout,
          color: Colors.white,
          size: 28,
        ),
      ),
    ],
  );
}
