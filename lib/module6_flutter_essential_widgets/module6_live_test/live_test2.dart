import 'package:flutter/material.dart';

void main() {
  runApp(
    ShoppingApp(),
  );
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShoppingActivities(),
      debugShowCheckedModeBanner: true,
      title: "My Shopping App",
    );
  }
}

class ShoppingActivities extends StatelessWidget {
  const ShoppingActivities({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Shopping List",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body: Scrollbar(
        thickness: 10,
        child: Column(
          children: [
            ListTile(
              title: Text(
                "Apples",
              ),
              leading: Icon(
                Icons.card_travel,
              ),
            ),
            ListTile(
              title: Text(
                "Bananas",
              ),
              leading: Icon(
                Icons.card_travel,
              ),
            ),
            ListTile(
              title: Text(
                "Bread",
              ),
              leading: Icon(
                Icons.card_travel,
              ),
            ),
            ListTile(
              title: Text(
                "Milk",
              ),
              leading: Icon(
                Icons.card_travel,
              ),
            ),
            ListTile(
              title: Text(
                "Eggs",
              ),
              leading: Icon(
                Icons.card_travel,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
