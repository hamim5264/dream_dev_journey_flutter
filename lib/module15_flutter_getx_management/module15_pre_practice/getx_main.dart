import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_pre_practice/getx_app_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    const MyGetXApp(),
  );
}

class MyGetXApp extends StatelessWidget {
  const MyGetXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MyGetXAppHome(),
    );
  }
}
