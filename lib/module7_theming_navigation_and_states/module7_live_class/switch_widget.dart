import 'package:flutter/material.dart';

void main() {
  runApp(
    SwitchApp(),
  );
}

class SwitchApp extends StatelessWidget {
  const SwitchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      title: "Switch Details",
      debugShowCheckedModeBanner: true,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Switch",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch(value: true, onChanged: (bool value) {}),
            Switch.adaptive(value: false, onChanged: (bool value) {}),
          ],
        ),
      ),
    );
  }
}
