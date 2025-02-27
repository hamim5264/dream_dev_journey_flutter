import 'package:dream_dev_journey_flutter/module16_flutter_firebase/obx_counter_app_with_firebase/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../module16_flutter_firebase/obx_counter_app_with_firebase/counter_state_controller.dart';


class CounterAppWithFirebaseHomeScreen extends StatefulWidget {
  const CounterAppWithFirebaseHomeScreen({super.key});

  @override
  State<CounterAppWithFirebaseHomeScreen> createState() =>
      _CounterAppWithFirebaseHomeScreenState();
}

class _CounterAppWithFirebaseHomeScreenState
    extends State<CounterAppWithFirebaseHomeScreen> {
  CounterStateController counterStateController =
      Get.find<CounterStateController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Counter App With GetX State Management",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<CounterStateController>(
              builder: (controller) {
                return Text(
                  "Count: ${controller.count.toString()}",
                  style: Theme.of(context).textTheme.headlineLarge,
                );
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green,),
                onPressed: (){
                Get.to(const SecondScreen());
                },
                child: const Text("Go to second screen", style: TextStyle(color: Colors.white,),),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterStateController.updateValue(1);
        },
        backgroundColor: Colors.green,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
