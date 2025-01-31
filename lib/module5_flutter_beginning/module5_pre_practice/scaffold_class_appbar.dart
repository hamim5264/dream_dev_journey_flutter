import 'package:flutter/material.dart';

void main() {
  runApp(
    AppBarExplore(),
  );
}

class AppBarExplore extends StatelessWidget {
  const AppBarExplore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppActivity(),
    );
  }
}

class AppActivity extends StatelessWidget {
  const AppActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AppBar",
        ),
        titleSpacing: 10,
        //centerTitle: true,
        toolbarHeight: 60,
        toolbarOpacity: 1,
        elevation: 10,
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.message),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.email),
          ),
        ],
      ),
    );
  }
}
