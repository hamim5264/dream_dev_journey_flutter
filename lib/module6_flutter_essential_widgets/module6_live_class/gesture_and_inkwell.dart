import 'package:flutter/material.dart';

void main() {
  runApp(
    GestureApp(),
  );
}

class GestureApp extends StatelessWidget {
  const GestureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GestureActivity(),
      debugShowCheckedModeBanner: true,
      title: "Gesture and Inkwell Details",
    );
  }
}

class GestureActivity extends StatelessWidget {
  const GestureActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Gesture & Inkwell",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                print(
                  "Tapped on hello world",
                );
              },
              onDoubleTap: () {
                print(
                  "Tapped on hello world",
                );
              },
              onLongPress: () {
                print(
                  "Tapped on hello world",
                );
              },
              child: Text(
                "Hello world",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                print(
                  "Tapped on hello world",
                );
              },
              onDoubleTap: () {
                print(
                  "Tapped on hello world",
                );
              },
              onLongPress: () {
                print(
                  "Tapped on hello world",
                );
              },
              borderRadius: BorderRadius.circular(
                16,
              ),
              child: Text(
                "Hello world",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
