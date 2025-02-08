import 'package:flutter/material.dart';

void main() {
  runApp(
    MyBagApp(),
  );
}

class MyBagApp extends StatelessWidget {
  const MyBagApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyBagHomeScreen(),
      title: "My Bag",
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyBagHomeScreen extends StatefulWidget {
  const MyBagHomeScreen({super.key});

  @override
  State<MyBagHomeScreen> createState() => _MyBagHomeScreenState();
}

class _MyBagHomeScreenState extends State<MyBagHomeScreen> {
  int pullItemCount = 1;
  int basePullPrice = 51;
  int pullEachItemPrice = 51;

  int shirtItemCount = 1;
  int baseShirtPrice = 30;
  int shirtEachPrice = 30;

  int sportsItemCount = 1;
  int baseSportsPrice = 43;
  int sportsEachPrice = 43;

  int totalAmount = 0;

  void checkOutAmount() {
    totalAmount = pullEachItemPrice + shirtEachPrice + sportsEachPrice;
    setState(() {});
  }

  mySnackBar(message, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: (Text(message)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "My Bag",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Card(
            child: ListTile(
              title: Row(
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  const Text(
                    "Pull Over",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              leading: SizedBox(
                height: 80,
                width: 80,
                child: Image.network(
                  "https://images.unsplash.com/photo-1508216310976-c518daae0cdc?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDB8fGhvb2RpZXxlbnwwfHwwfHx8MA%3D%3D",
                  fit: BoxFit.cover,
                ),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.more_vert,
                    color: Colors.black,
                  ),
                  Text(
                    "$pullEachItemPrice\$",
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              subtitle: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          const TextSpan(
                            text: "Color: ",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          const TextSpan(
                            text: "Black  ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          const TextSpan(
                            text: "  Size: ",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          const TextSpan(
                            text: "L",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                      ),
                      // Text("Color: Black",),
                      // Text("Size: L",),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (pullItemCount > 1) {
                            pullItemCount--;
                            pullEachItemPrice = pullItemCount * basePullPrice;
                            checkOutAmount();
                            setState(() {});
                          }
                        },
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "$pullItemCount",
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          pullItemCount++;
                          pullEachItemPrice = pullItemCount * basePullPrice;
                          checkOutAmount();
                          setState(() {});
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Row(
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  const Text(
                    "T-Shirt",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              leading: SizedBox(
                height: 80,
                width: 80,
                child: Image.network(
                  "https://plus.unsplash.com/premium_photo-1705883266313-010571f1b9a7?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Njl8fHNxdWFyZSUyMHNoYXBlJTIwaG9vZGllJTIwcGljdHVyZXxlbnwwfHwwfHx8MA%3D%3D",
                  fit: BoxFit.cover,
                ),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.more_vert,
                    color: Colors.black,
                  ),
                  Text(
                    "$shirtEachPrice\$",
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              subtitle: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          const TextSpan(
                            text: "Color: ",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          const TextSpan(
                            text: "Grey  ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          const TextSpan(
                            text: "  Size: ",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          const TextSpan(
                            text: "L",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                      ),
                      // Text("Color: Black",),
                      // Text("Size: L",),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (shirtItemCount > 1) {
                            shirtItemCount--;
                            shirtEachPrice = shirtItemCount * baseShirtPrice;
                            checkOutAmount();
                            setState(() {});
                          }
                        },
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "$shirtItemCount",
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          shirtItemCount++;
                          shirtEachPrice = shirtItemCount * baseShirtPrice;
                          checkOutAmount();
                          setState(() {});
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Row(
                children: [
                  const SizedBox(
                    width: 22,
                  ),
                  const Text(
                    "Sports Dress",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              leading: SizedBox(
                height: 80,
                width: 80,
                child: Image.network(
                  "https://plus.unsplash.com/premium_photo-1733701621462-a74d3d408319?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTAxfHxzcXVhcmUlMjBzaGFwZSUyMGhvb2RpZSUyMHBpY3R1cmV8ZW58MHx8MHx8fDA%3D",
                  fit: BoxFit.cover,
                ),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.more_vert,
                    color: Colors.black,
                  ),
                  Text(
                    "$sportsEachPrice\$",
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              subtitle: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          const TextSpan(
                            text: "Color: ",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          const TextSpan(
                            text: "Black  ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          const TextSpan(
                            text: "  Size: ",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          const TextSpan(
                            text: "M",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                      ),
                      // Text("Color: Black",),
                      // Text("Size: L",),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (sportsItemCount > 1) {
                            sportsItemCount--;
                            sportsEachPrice = sportsItemCount * baseSportsPrice;
                            checkOutAmount();
                            setState(() {});
                          }
                        },
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "$sportsItemCount",
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          sportsItemCount++;
                          sportsEachPrice = sportsItemCount * baseSportsPrice;
                          checkOutAmount();
                          setState(() {});
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 200,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total Amount:",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "$totalAmount\$",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 330,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    mySnackBar(
                        "Congratulations! you have bought total $totalAmount\$",
                        context);
                  },
                  child: const Text(
                    "CHECK OUT",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
