import 'package:flutter/material.dart';

/// Navigation -> One page to another page
/// Navigator -> 1(simple & lengthy), 2(complex)
/// Routers package -> Getx, GoRoute, Auto Route

void main() {
  runApp(
    NavigatorApp(),
  );
}

class NavigatorApp extends StatelessWidget {
  const NavigatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavigatorActivity(),
      debugShowCheckedModeBanner: true,
      title: "Navigator Details",
    );
  }
}

/// Route 1
class NavigatorActivity extends StatelessWidget {
  const NavigatorActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Navigation",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Home",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ///Navigation - Route home -> Route settings
                ///Navigator
                ///Navigator.typeOfNavigation(CurrentLocation, Destination)
                ///Navigation -> Push, Pop(back), replace, replaceAll, removeUntil.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsScreen(),
                  ),
                );
              },
              child: Text(
                "Go to settings",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Route 2
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Settings",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrdersScreen(),
                  ),
                );
              },
              child: Text(
                "Go to order",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NavigatorActivity(),
                  ),
                  (route) => false,
                );
              },
              child: Text(
                "Back to home",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Route 3
class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Orders",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Orders",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsScreen(),
                  ),
                );
              },
              child: Text(
                "Go to settings",
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Go to Home",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
