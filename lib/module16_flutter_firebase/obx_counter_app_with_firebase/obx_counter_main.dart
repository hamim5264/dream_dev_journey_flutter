import 'package:dream_dev_journey_flutter/module16_flutter_firebase/obx_counter_app_with_firebase/counter_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const CounterAppWithFirebase(),
  );
}
