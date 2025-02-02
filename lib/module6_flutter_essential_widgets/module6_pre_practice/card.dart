import 'package:flutter/material.dart';

void main() {
  runApp(
    CardApp(),
  );
}

class CardApp extends StatelessWidget {
  const CardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CardActivity(),
      debugShowCheckedModeBanner: true,
      title: "Card Details",
    );
  }
}

class CardActivity extends StatelessWidget {
  const CardActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Card App",
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
          shadowColor: Color.fromRGBO(
            33,
            191,
            115,
            1,
          ),
          color: Color.fromRGBO(
            33,
            191,
            115,
            1,
          ),
          elevation: 50,
          child: SizedBox(
            height: 200,
            width: 200,
            child: Center(
                child: Text(
              "This is card",
            )),
          ),
        ),
      ),
    );
  }
}
