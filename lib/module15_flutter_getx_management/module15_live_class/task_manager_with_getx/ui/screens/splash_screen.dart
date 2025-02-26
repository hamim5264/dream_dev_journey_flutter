import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/task_manager_with_getx/data/utilities/asset_utilities.dart';
import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/task_manager_with_getx/data/utilities/auth_utility.dart';
import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/task_manager_with_getx/ui/screens/bottom_nav_base.dart';
import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_live_class/task_manager_with_getx/ui/widgets/screen_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'log_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navigateToNextPage();
    });
  }

  void navigateToNextPage() {
    Future.delayed(const Duration(seconds: 3)).then((value) async {
      final bool isUserLoggedIn = await AuthUtility.isUserLoggedIn();
      Get.offAll(
          () => isUserLoggedIn ? const BottomNavBase() : const LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AssetsUtils.appLogoPNG,
                width: MediaQuery.sizeOf(context).width * 0.2),
          ],
        ),
      ),
    );
  }
}
