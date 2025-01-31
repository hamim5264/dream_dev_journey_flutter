import 'package:flutter/material.dart';

void main() {
  runApp(
    FloatingActionButtonApp(),
  );
}

class FloatingActionButtonApp extends StatelessWidget {
  const FloatingActionButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FloatingActivity(),
    );
  }
}

class FloatingActivity extends StatelessWidget {
  const FloatingActivity({super.key});

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
          "Floating Action Button",
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          mySnackBar("Floating Tapped Success", context);
        },
        elevation: 10,
        backgroundColor: Colors.amber,
        child: Icon(
          Icons.add_sharp,
        ),
      ),
    );
  }
}
