import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NamedHomeScreen extends StatelessWidget {
  const NamedHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Named Routing Home Screen",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //Get.toNamed("/namedScreen");
            Get.offNamed("/namedScreen");
          },
          child: Text(
            "Go to Named Routing Page",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
