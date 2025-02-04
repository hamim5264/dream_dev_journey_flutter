import 'package:flutter/material.dart';

import 'style.dart';

void main() {
  runApp(
    MediaQueryApp(),
  );
}

class MediaQueryApp extends StatelessWidget {
  const MediaQueryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MediaQueryActivity(),
      debugShowCheckedModeBanner: true,
      title: "MediaQueryDetails",
    );
  }
}

class MediaQueryActivity extends StatelessWidget {
  const MediaQueryActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MediaQuery",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Hello Flutter!",
            style: headLine(context),
          ),
        ],
      ),
    );
  }
}
