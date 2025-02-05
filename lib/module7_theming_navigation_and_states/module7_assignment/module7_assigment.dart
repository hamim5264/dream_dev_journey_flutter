import 'package:flutter/material.dart';

void main() {
  runApp(
    CartApp(),
  );
}

class CartApp extends StatelessWidget {
  const CartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      home: CartHomeScreen(),
      title: "Cart App",
      debugShowCheckedModeBanner: false,
    );
  }
}

class CartHomeScreen extends StatefulWidget {
  const CartHomeScreen({super.key});

  @override
  State<CartHomeScreen> createState() => _CartHomeScreenState();
}

class _CartHomeScreenState extends State<CartHomeScreen> {
  final int productCount = 20;
  late List<int> itemCounters;

  @override
  void initState() {
    super.initState();
    itemCounters =
        List<int>.filled(productCount, 0); // Initialize all counters to 0
  }

  int getTotalProducts() {
    int total = 0;
    for (int count in itemCounters) {
      total += count;
    }
    return total;
  }

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
        backgroundColor: Colors.blue,
        //iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView.separated(
        itemCount: productCount,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              "Product ${index + 1}",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text("\$${index + 20}"),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Count: ${itemCounters[index].toString()}",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Expanded(
                    child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    if (itemCounters[index] == 5) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                "Congratulations!",
                              ),
                              content:
                                  Text("You have bought Product ${index + 1}"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Ok",
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          });
                    } else {
                      setState(() {
                        itemCounters[index]++;
                      });
                    }
                  },
                  child: Text(
                    "Buy Now",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CartPage(
                      totalNumberOfProducts: getTotalProducts(),
                    )),
          );
        },
        child: Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
      ),
    );
  }
}

class CartPage extends StatefulWidget {
  final int totalNumberOfProducts;

  const CartPage({super.key, required this.totalNumberOfProducts});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          "Total Products: ${widget.totalNumberOfProducts}",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
