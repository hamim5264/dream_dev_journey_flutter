import 'package:flutter/material.dart';

void main() {
  runApp(
    AspectRatioApp(),
  );
}

class AspectRatioApp extends StatelessWidget {
  const AspectRatioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AspectRatioAppActivity(),
      debugShowCheckedModeBanner: true,
      title: "Aspect Ratio Details",
    );
  }
}

class AspectRatioAppActivity extends StatelessWidget {
  const AspectRatioAppActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Aspect Ratio",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        width: double.infinity,
        height: 300,
        color: Colors.red,
        alignment: Alignment.center,
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
