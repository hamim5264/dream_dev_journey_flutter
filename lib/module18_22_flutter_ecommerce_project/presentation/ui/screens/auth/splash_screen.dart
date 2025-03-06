import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/presentation/state_holders/auth_controller.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/presentation/ui/screens/auth/verify_email_screen.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    moveToNextScreen();
  }

  Future<void> moveToNextScreen() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    final bool isLoggedIn = await Get.find<AuthController>().isLoggedIn();
    if (isLoggedIn) {
      Get.offAll(const MainBottomNavScreen());
    } else {
      Get.offAll(const VerifyEmailScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            const AppLogo(),
            const Spacer(),
            const CircularProgressIndicator(),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Version 2.0.1",
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
