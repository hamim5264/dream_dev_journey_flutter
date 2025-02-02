import 'package:flutter/material.dart';

void main() {
  runApp(
    ListViewBuilderApp(),
  );
}

class ListViewBuilderApp extends StatelessWidget {
  const ListViewBuilderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListViewBuilderActivity(),
      debugShowCheckedModeBanner: true,
      title: "List View Builder",
    );
  }
}

class ListViewBuilderActivity extends StatelessWidget {
  ListViewBuilderActivity({super.key});

  /// Custom Toast Message
  mySnackBar(message, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  ///Json Array
  var myItems = [
    {
      "img":
          "https://images.unsplash.com/photo-1633419461186-7d40a38105ec?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8d2luZG93cyUyMDEwfGVufDB8fDB8fHww",
      "title": "Windows-XP"
    },
    {
      "img":
          "https://images.unsplash.com/photo-1633419461186-7d40a38105ec?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8d2luZG93cyUyMDEwfGVufDB8fDB8fHww",
      "title": "Windows-7"
    },
    {
      "img":
          "https://images.unsplash.com/photo-1633419461186-7d40a38105ec?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8d2luZG93cyUyMDEwfGVufDB8fDB8fHww",
      "title": "Windows-8"
    },
    {
      "img":
          "https://images.unsplash.com/photo-1633419461186-7d40a38105ec?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8d2luZG93cyUyMDEwfGVufDB8fDB8fHww",
      "title": "Windows-10"
    },
    {
      "img":
          "https://images.unsplash.com/photo-1633419461186-7d40a38105ec?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8d2luZG93cyUyMDEwfGVufDB8fDB8fHww",
      "title": "Windows-Vista"
    },
    {
      "img":
          "https://images.unsplash.com/photo-1633419461186-7d40a38105ec?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8d2luZG93cyUyMDEwfGVufDB8fDB8fHww",
      "title": "Windows-95"
    },
    {
      "img":
          "https://images.unsplash.com/photo-1633419461186-7d40a38105ec?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8d2luZG93cyUyMDEwfGVufDB8fDB8fHww",
      "title": "Windows-98"
    },
    {
      "img":
          "https://images.unsplash.com/photo-1633419461186-7d40a38105ec?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8d2luZG93cyUyMDEwfGVufDB8fDB8fHww",
      "title": "Windows-2000"
    },
    {
      "img":
          "https://images.unsplash.com/photo-1633419461186-7d40a38105ec?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8d2luZG93cyUyMDEwfGVufDB8fDB8fHww",
      "title": "Linux"
    },
    {
      "img":
          "https://images.unsplash.com/photo-1633419461186-7d40a38105ec?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8d2luZG93cyUyMDEwfGVufDB8fDB8fHww",
      "title": "Ubuntu"
    },
    {
      "img":
          "https://images.unsplash.com/photo-1633419461186-7d40a38105ec?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8d2luZG93cyUyMDEwfGVufDB8fDB8fHww",
      "title": "IOS"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List View Builder App",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
          itemCount: myItems.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onDoubleTap: () {
                mySnackBar(myItems[index]["title"], context);
              },
              onLongPress: () {
                mySnackBar(myItems[index]["title"], context);
              },
              onTap: () {
                mySnackBar(myItems[index]["title"], context);
              },
              child: Container(
                margin: EdgeInsets.all(
                  15,
                ),
                width: double.infinity,
                height: 200,
                child: Image.network(
                  myItems[index]["img"]!,
                  fit: BoxFit.fill,
                ),
              ),
            );
          }),
    );
  }
}
