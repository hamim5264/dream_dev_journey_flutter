import 'package:dream_dev_journey_flutter/module17_flutter_location_and_map_widgets/live_class/google_map_home_screen.dart';
import 'package:dream_dev_journey_flutter/module17_flutter_location_and_map_widgets/live_class/location_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyGoogleMapApp(),
  );
}

class MyGoogleMapApp extends StatelessWidget {
  const MyGoogleMapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GoogleMapHomeScreen(),
    );
  }
}
