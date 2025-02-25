import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_pre_practice/counter_app/getX_counter_app_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(const GetXCounterApp(),);
}
class GetXCounterApp extends StatelessWidget {
  const GetXCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: GetXCounterAppHomeScreen(),
    );
  }
}
