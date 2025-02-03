import 'package:flutter/material.dart';

void main() {
  runApp(
    GridViewApp(),
  );
}

class GridViewApp extends StatelessWidget {
  const GridViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GridViewActivity(),
      debugShowCheckedModeBanner: true,
      title: "Grid View Details",
    );
  }
}

class GridViewActivity extends StatelessWidget {
  const GridViewActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Grid View",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Scrollbar(
        thickness: 15,
        radius: Radius.circular(15),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          children: [
            Icon(
              Icons.adb,
            ),
            Icon(
              Icons.adb,
            ),
            Icon(
              Icons.adb,
            ),
            Icon(
              Icons.adb,
            ),
            Icon(
              Icons.adb,
            ),
            Icon(
              Icons.adb,
            ),
            Icon(
              Icons.adb,
            ),
            Icon(
              Icons.adb,
            ),
            Icon(
              Icons.adb,
            ),
            Icon(
              Icons.adb,
            ),
            Icon(
              Icons.adb,
            ),
            Icon(
              Icons.adb,
            ),
            Icon(
              Icons.adb,
            ),
            Icon(
              Icons.adb,
            ),
            Icon(
              Icons.adb,
            ),
            Icon(
              Icons.adb,
            ),
            Icon(
              Icons.adb,
            ),
            Icon(
              Icons.adb,
            ),
            Icon(
              Icons.adb,
            ),
            Icon(
              Icons.adb,
            ),
            Icon(
              Icons.adb,
            ),
            Icon(
              Icons.adb,
            ),
            Icon(
              Icons.adb,
            ),
            Icon(
              Icons.adb,
            ),
            Icon(
              Icons.adb,
            ),
            Icon(
              Icons.adb,
            ),
            Icon(
              Icons.adb,
            ),
            Icon(
              Icons.adb,
            ),
            Icon(
              Icons.adb,
            ),
            Icon(
              Icons.adb,
            ),
            Icon(
              Icons.adb,
            ),
            Icon(
              Icons.adb,
            ),
          ],
        ),
      ),
    );
  }
}
