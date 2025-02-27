import 'package:dream_dev_journey_flutter/module16_flutter_firebase/obx_counter_app_with_firebase/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../module16_flutter_firebase/obx_counter_app_with_firebase/counter_state_controller.dart';

class CounterAppWithFirebase extends StatelessWidget {
  const CounterAppWithFirebase({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const CounterAppWithFirebaseHomeScreen(),
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
