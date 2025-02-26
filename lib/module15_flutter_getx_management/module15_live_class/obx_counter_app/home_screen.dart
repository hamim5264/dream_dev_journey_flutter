import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/obx_counter_app/counter_state_controller.dart';
import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/obx_counter_app/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterAppWithObxHomeScreen extends StatefulWidget {
  const CounterAppWithObxHomeScreen({super.key});

  @override
  State<CounterAppWithObxHomeScreen> createState() =>
      _CounterAppWithObxHomeScreenState();
}

class _CounterAppWithObxHomeScreenState
    extends State<CounterAppWithObxHomeScreen> {
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
