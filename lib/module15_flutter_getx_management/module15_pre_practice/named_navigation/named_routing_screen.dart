import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NamedRoutingScreen extends StatelessWidget {
  const NamedRoutingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Named Routing Screen",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //Get.toNamed("/");
            Get.offNamed("/");
          },
          child: Text(
            "Go to home page",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
