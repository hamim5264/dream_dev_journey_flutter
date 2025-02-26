import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/obx_counter_app/counter_state_controller.dart';
import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/obx_counter_app/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterAppWithObx extends StatelessWidget {
  const CounterAppWithObx({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const CounterAppWithObxHomeScreen(),
      title: "GetX State Management",
      initialBinding: GetXDependencyBinder(),
    );
  }
}

class GetXDependencyBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(CounterStateController());
  }
}
