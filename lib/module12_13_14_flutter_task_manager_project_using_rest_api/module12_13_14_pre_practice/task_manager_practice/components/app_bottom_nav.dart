import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_pre_practice/task_manager_practice/style/task_styles.dart';
import 'package:flutter/material.dart';

BottomNavigationBar appBottomNav(currentIndex, onItemTapped) {
  return BottomNavigationBar(
    selectedItemColor: colorGreen,
    unselectedItemColor: colorLightGray,
    currentIndex: currentIndex,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    onTap: onItemTapped,
    type: BottomNavigationBarType.fixed,
    items: [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.article,
        ),
        label: "New",
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.incomplete_circle,
        ),
        label: "Progress",
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.assignment_turned_in,
        ),
        label: "Completed",
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.cancel_rounded,
        ),
        label: "Cancelled",
      ),
    ],
  );
}
