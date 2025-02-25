import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_pre_practice/named_navigation/named_home_screen.dart';
import 'package:dream_dev_journey_flutter/module15_flutter_getx_management/module15_pre_practice/named_navigation/named_routing_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(
    const GetXNamedRoutingApp(),
  );
}

class GetXNamedRoutingApp extends StatelessWidget {
  const GetXNamedRoutingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      getPages: [
        GetPage(
            name: "/",
            page: () => NamedHomeScreen(),
            transition: Transition.zoom),
        GetPage(
            name: "/namedScreen",
            page: () => NamedRoutingScreen(),
            transition: Transition.leftToRight),
      ],
    );
  }
}
