import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/obx_counter_app/home_screen.dart';
import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/obx_counter_app/second_screen.dart';
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
                Get.offAll(const CounterAppWithObxHomeScreen());
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
