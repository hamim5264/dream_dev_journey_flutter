import 'package:flutter/material.dart';

void main() {
  runApp(
    StackApp(),
  );
}

class StackApp extends StatelessWidget {
  const StackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StackHomeScreen(),
      title: "StackHomeScreen",
      debugShowCheckedModeBanner: true,
    );
  }
}

class StackHomeScreen extends StatelessWidget {
  const StackHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Stack & Responsive Widgets",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.lightBlueAccent,
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 10,
              child: Container(
                width: 30,
                height: 30,
                color: Colors.red,
              ),
            ),
            Positioned(
              bottom: 15,
              left: 10,
              child: Container(
                width: 20,
                height: 20,
                color: Colors.lightGreenAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
