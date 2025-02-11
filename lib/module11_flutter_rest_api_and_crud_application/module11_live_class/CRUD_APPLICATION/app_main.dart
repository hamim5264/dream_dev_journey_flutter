import 'package:dream_dev_journey_flutter/module11_flutter_rest_api_and_crud_application/module11_live_class/CRUD_APPLICATION/application_screens/product_list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const CrudApplication(),
  );
}

class CrudApplication extends StatelessWidget {
  const CrudApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductListScreen(),
      title: "CRUD Application",
      debugShowCheckedModeBanner: true,
    );
  }
}
