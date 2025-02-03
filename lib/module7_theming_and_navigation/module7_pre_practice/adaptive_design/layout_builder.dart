import 'package:flutter/material.dart';

void main() {
  runApp(
    LayoutBuilderApp(),
  );
}

class LayoutBuilderApp extends StatelessWidget {
  const LayoutBuilderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LayoutBuilderActivity(),
      debugShowCheckedModeBanner: true,
      title: "LayoutBuilder Details",
    );
  }
}

class LayoutBuilderActivity extends StatelessWidget {
  const LayoutBuilderActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "LayoutBuilder",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 600) {
            return Container(
              height: 400,
              width: 400,
              color: Colors.green,
            );
          } else {
            return Container(
              height: 200,
              width: 200,
              color: Colors.red,
            );
          }
        },
      ),
    );
  }
}
