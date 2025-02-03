import 'package:flutter/material.dart';

void main() {
  runApp(
    FlexibleApp(),
  );
}

class FlexibleApp extends StatelessWidget {
  const FlexibleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FlexibleActivity(),
      debugShowCheckedModeBanner: true,
      title: "Flexible Details",
    );
  }
}

class FlexibleActivity extends StatelessWidget {
  const FlexibleActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flexible",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            ///By default flex value = 1
            fit: FlexFit.loose,
            flex: 10,
            child: Container(
              color: Colors.purple,
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            flex: 40,
            child: Container(
              color: Colors.blue,
            ),
          ),
          Flexible(
            flex: 30,
            child: Container(
              color: Colors.yellow,
            ),
          ),
          Flexible(
            flex: 20,
            child: Container(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
