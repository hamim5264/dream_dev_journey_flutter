import 'package:flutter/material.dart';

void main() {
  runApp(
    SnackBarApp(),
  );
}

class SnackBarApp extends StatelessWidget {
  const SnackBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SnackBarActivity(),
    );
  }
}

class SnackBarActivity extends StatelessWidget {
  const SnackBarActivity({super.key});

  mySnackBar(message, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SnackBar",
        ),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            onPressed: () {
              mySnackBar("Hey, it's message", context);
            },
            icon: Icon(
              Icons.message,
            ),
          ),
          IconButton(
            onPressed: () {
              mySnackBar("Hey it's search", context);
            },
            icon: Icon(
              Icons.settings,
            ),
          ),
          IconButton(
            onPressed: () {
              mySnackBar("Hey it's search", context);
            },
            icon: Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () {
              mySnackBar("Hey it's search", context);
            },
            icon: Icon(
              Icons.mail,
            ),
          ),
        ],
      ),
    );
  }
}
