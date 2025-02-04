import 'package:flutter/material.dart';

void main() {
  runApp(
    FractionallySizedBoxApp(),
  );
}

class FractionallySizedBoxApp extends StatelessWidget {
  const FractionallySizedBoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FractionallySizedBoxActivity(),
      debugShowCheckedModeBanner: true,
      title: "Fractionally Sized Box Details",
    );
  }
}

class FractionallySizedBoxActivity extends StatelessWidget {
  const FractionallySizedBoxActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FractionallySizedBox",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          heightFactor: 0.3,
          child: Container(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
