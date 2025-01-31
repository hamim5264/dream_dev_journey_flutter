import 'package:flutter/material.dart';

void main() {
  runApp(
    const SourceCodeFlow(),
  );
}

class SourceCodeFlow extends StatelessWidget {
  const SourceCodeFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      color: Colors.blue,
      debugShowCheckedModeBanner: false,
      home: HomeActivity(),
    );
  }
}

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Source Code Flow Structure",
        ),
      ),
      body: Text(
        "Hello Flutter",
      ),
    );
  }
}
