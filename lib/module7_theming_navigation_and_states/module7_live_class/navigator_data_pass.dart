import 'package:flutter/material.dart';

/// Navigation -> One page to another page
/// Navigator -> 1(simple & lengthy), 2(complex)
/// Routers package -> GetX, GoRoute, Auto Route

void main() {
  runApp(
    NavigatorDataPassApp(),
  );
}

class NavigatorDataPassApp extends StatelessWidget {
  const NavigatorDataPassApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavigatorActivity(),
      debugShowCheckedModeBanner: true,
      title: "Navigator Data Pass Details",
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
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductListScreen(),
                  ),
                );
              },
              child: Text(
                "Go to Product List",
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

///Route 4
class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product List",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(
                      productName: index.toString(),
                      price: 350,
                    ),
                  ),
                ).then((value) {
                  print(value);
                });
              },
              title: Text(
                index.toString(),
              ),
            );
          }),
    );
  }
}

///Route 5
class ProductDetailsScreen extends StatelessWidget {
  final String productName;

  ///Mandatory/Required
  final double? price;

  ///Optional
  const ProductDetailsScreen(
      {super.key, required this.productName, this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Details",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              productName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, "My-name $productName");
              },
              child: Text(
                "Back",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
