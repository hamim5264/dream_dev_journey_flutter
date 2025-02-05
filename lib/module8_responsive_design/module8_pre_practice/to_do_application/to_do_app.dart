import 'package:flutter/material.dart';

import 'to_do_app_home_screen.dart';

void main() {
  runApp(
    ToDoApp(),
  );
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ToDoHomeScreen(),
      title: "To Do Application",
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.lightGreen,
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightGreen,
            foregroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
