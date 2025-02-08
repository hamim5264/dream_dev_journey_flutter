import 'package:dream_dev_journey_flutter/module10_flutter_stateful_todo_project_and_rest_API_foundation/module10_live_class/to_do_application/my_to_do_app_home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MyToDoApp(),
  );
}

class MyToDoApp extends StatelessWidget {
  const MyToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyToDoAppHomeScreen(),
      title: "My To Do App",
      debugShowCheckedModeBanner: true,
    );
  }
}
