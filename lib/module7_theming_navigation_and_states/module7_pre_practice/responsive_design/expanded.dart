import 'package:flutter/material.dart';

void main() {
  runApp(
    ExpandedApp(),
  );
}

class ExpandedApp extends StatelessWidget {
  const ExpandedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExpandedActivity(),
      debugShowCheckedModeBanner: true,
      title: "Expanded Details",
    );
  }
}

class ExpandedActivity extends StatelessWidget {
  const ExpandedActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Expanded",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            ///By default flex value = 1
            flex: 1,
            child: Container(
              color: Colors.purple,
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.blue,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.yellow,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
