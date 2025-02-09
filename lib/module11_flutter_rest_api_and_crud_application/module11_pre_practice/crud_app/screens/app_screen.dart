import 'package:dream_dev_journey_flutter/module11_flutter_rest_api_and_crud_application/module11_pre_practice/crud_app/screens/product_grid_view_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    CRUDApp(),
  );
}

class CRUDApp extends StatelessWidget {
  const CRUDApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductGridViewScreen(),
      title: "CURD Application",
      debugShowCheckedModeBanner: true,
    );
  }
}
