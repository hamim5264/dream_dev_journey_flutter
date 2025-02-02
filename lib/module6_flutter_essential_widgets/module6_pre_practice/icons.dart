import 'package:flutter/material.dart';

void main() {
  runApp(
    IconApp(),
  );
}

class IconApp extends StatelessWidget {
  const IconApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IconActivity(),
      debugShowCheckedModeBanner: true,
      title: "Icon Details",
    );
  }
}

class IconActivity extends StatelessWidget {
  const IconActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Icon App",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Icon(
          Icons.camera,
          size: 200,
          color: Colors.black,
        ),
      ),
    );
  }
}
