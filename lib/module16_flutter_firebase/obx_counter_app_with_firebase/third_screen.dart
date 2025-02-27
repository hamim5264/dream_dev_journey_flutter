import 'package:dream_dev_journey_flutter/module16_flutter_firebase/obx_counter_app_with_firebase/home_screen.dart';
import 'package:dream_dev_journey_flutter/module16_flutter_firebase/obx_counter_app_with_firebase/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Third Screen",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.yellowAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(const SecondScreen());
              },
              child: const Text(
                "Go to second screen",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.offAll(const CounterAppWithFirebaseHomeScreen());
              },
              child: const Text(
                "Go to home",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Get.back(result: true);
              },
              child: const Text(
                "Back",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
