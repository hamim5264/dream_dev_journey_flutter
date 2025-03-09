import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/controller_binder.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/presentation/state_holders/theme_controller.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/presentation/ui/screens/auth/splash_screen.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/presentation/ui/utility/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBayApp extends StatelessWidget {
  const CraftyBayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      themeMode: ThemeController().themeMode.value,
      home: const SplashScreen(),
      initialBinding: ControllerBinder(),
    );
  }
}
