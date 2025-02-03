import 'package:flutter/material.dart';

void main() {
  runApp(
    ScrollViewApp(),
  );
}

class ScrollViewApp extends StatelessWidget {
  const ScrollViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScrollViewActivity(),
      debugShowCheckedModeBanner: true,
      title: "ScrollView Details",
    );
  }
}

class ScrollViewActivity extends StatelessWidget {
  const ScrollViewActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ScrollView",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,

        ///For Row->
        //scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            Container(
              height: 200,
              width: 200,
              color: Colors.red,
            ),
            Divider(),
            Container(
              height: 200,
              width: 200,
              color: Colors.green,
            ),
            Divider(),
            Container(
              height: 200,
              width: 200,
              color: Colors.white,
            ),
            Divider(),
            Container(
              height: 200,
              width: 200,
              color: Colors.black,
            ),
            Divider(),
            Container(
              height: 200,
              width: 200,
              color: Colors.blue,
            ),
            Divider(),
            Container(
              height: 200,
              width: 200,
              color: Colors.orange,
            ),
            Divider(),
            Container(
              height: 200,
              width: 200,
              color: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
