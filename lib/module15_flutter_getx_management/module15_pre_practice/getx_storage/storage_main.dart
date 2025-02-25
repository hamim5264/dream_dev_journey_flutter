import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_pre_practice/getx_storage/storage_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    const MyGetXStorageApp(),
  );
}

class MyGetXStorageApp extends StatelessWidget {
  const MyGetXStorageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: StorageHome(),
    );
  }
}