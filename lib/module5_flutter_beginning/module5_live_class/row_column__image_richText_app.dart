import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    RowColumn(),
  );
}

class RowColumn extends StatelessWidget {
  const RowColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RowColumnActivity(),
      debugShowCheckedModeBanner: true,
      title: "Row-Column",
    );
  }
}

class RowColumnActivity extends StatelessWidget {
  const RowColumnActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(
          "Row-Column",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Hello World!",
              ),
              Text(
                "Hello World!",
              ),
              Text(
                "Hello World!",
              ),
              Text(
                "Hello World!",
              ),
              Text(
                "Hello World!",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Hello, ",
                  ),
                  Text(
                    "are ",
                  ),
                  Text(
                    "you ",
                  ),
                  Text(
                    "Listening?",
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Hello flutter",
              ),
            ],
          ),
          Image.asset(
            "images/cat.jpg",
            width: 120,
            height: 90,
            fit: BoxFit.cover,
          ),
          Image.network(
            "https://images.unsplash.com/photo-1617040619263-41c5a9ca7521?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Zmx1dHRlcnxlbnwwfHwwfHx8MA%3D%3D",
            width: 200,
            height: 200,
            fit: BoxFit.scaleDown,
          ),
          RichText(
            text: TextSpan(
              text: "Hello ",
              children: [
                TextSpan(
                  text: "Dart- ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                TextSpan(
                  text: "Flutter",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          /// Example of RichText
          RichText(
            text: TextSpan(
              text: "To register, tap on ",
              children: [
                TextSpan(
                  text: "Sign up",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
