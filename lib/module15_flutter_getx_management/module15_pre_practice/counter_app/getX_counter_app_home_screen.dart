import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_pre_practice/counter_app/counter_state_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetXCounterAppHomeScreen extends StatelessWidget {
  const GetXCounterAppHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterStateController counterStateController =
        Get.put(CounterStateController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "GetX Counter App",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Obx(() => Text(
              "Count: ${counterStateController.count}",
              style: Theme.of(context).textTheme.headlineLarge,
            )),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          counterStateController.countIncrement();
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
