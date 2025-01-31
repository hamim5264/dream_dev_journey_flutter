import 'package:flutter/material.dart';

void main() {
  runApp(
    BottomNavBarApp(),
  );
}

class BottomNavBarApp extends StatelessWidget {
  const BottomNavBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavActivity(),
    );
  }
}

class NavActivity extends StatelessWidget {
  const NavActivity({super.key});

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
          "Bottom Nav Bar",
        ),
        centerTitle: true,
        backgroundColor: Colors.lightGreenAccent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          mySnackBar("Tapped!", context);
        },
        backgroundColor: Colors.lightGreenAccent,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightGreenAccent,
        currentIndex: 2,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_phone),
            label: "Contact",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        onTap: (int index) {
          if (index == 0) {
            mySnackBar("Hello, Home!", context);
          }
          if (index == 1) {
            mySnackBar("Hello, Contact", context);
          }
          if (index == 2) {
            mySnackBar("Hello, Profile", context);
          }
        },
      ),
    );
  }
}
