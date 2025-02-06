import 'package:flutter/material.dart';

void main() {
  runApp(
    NewsFeed(),
  );
}

class NewsFeed extends StatelessWidget {
  const NewsFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NewsFeedHomeScreen(),
      title: "News Feed Layout App",
      debugShowCheckedModeBanner: true,
    );
  }
}

class NewsFeedHomeScreen extends StatelessWidget {
  const NewsFeedHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News Feed",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return GridView.builder(
                itemCount: 20,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1),
                itemBuilder: (context, index) {
                  return Card(
                    child: Image.network(
                      "https://placehold.jp/150x150.png",
                    ),
                  );
                });
          }
          return GridView.builder(
              itemCount: 20,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Card(
                  child: Image.network(
                    "https://placehold.jp/150x150.png",
                  ),
                );
              });
        },
      ),
    );
  }
}
