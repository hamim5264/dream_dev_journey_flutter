import 'package:flutter/material.dart';

void main() {
  runApp(
    ProgressIndicatorApp(),
  );
}

class ProgressIndicatorApp extends StatelessWidget {
  const ProgressIndicatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProgressIndicatorActivity(),
      debugShowCheckedModeBanner: true,
      title: "Progress Indicator Details",
    );
  }
}

class ProgressIndicatorActivity extends StatelessWidget {
  const ProgressIndicatorActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Progress Indicator App",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CircularProgressIndicator(
                color: Colors.black,
                backgroundColor: Colors.red,
                strokeWidth: 5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: LinearProgressIndicator(
                minHeight: 5,
                color: Colors.black,
                backgroundColor: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
