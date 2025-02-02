import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MyAppClass1(),
  );
}

class MyAppClass1 extends StatelessWidget {
  const MyAppClass1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyAppHome(),
      debugShowCheckedModeBanner: true,
      title: "My-App",
    );
  }
}

class MyAppHome extends StatelessWidget {
  const MyAppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      appBar: AppBar(
        title: Text(
          "MyApp",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: Icon(
          Icons.android,
          color: Colors.amber,
          size: 40,
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Text(
            "Hello Flutter",
            style: TextStyle(
              color: Colors.black,
              fontSize: 32,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "Hello Dart",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "Hello World",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
