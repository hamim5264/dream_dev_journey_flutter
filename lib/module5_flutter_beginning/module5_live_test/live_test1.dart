import 'package:flutter/material.dart';

void main() {
  runApp(
    LiveTest1(),
  );
}

class LiveTest1 extends StatelessWidget {
  const LiveTest1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LiveTest1Activity(),
      debugShowCheckedModeBanner: true,
      title: "Module5-live-test",
    );
  }
}

class LiveTest1Activity extends StatelessWidget {
  const LiveTest1Activity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              color: Colors.green,
              size: 50,
            ),
            Text(
              "Jhon Doe",
              style: TextStyle(
                color: Colors.green,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Flutter Batch 4",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
