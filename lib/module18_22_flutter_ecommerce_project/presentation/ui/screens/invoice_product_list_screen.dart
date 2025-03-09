import 'package:flutter/material.dart';

class InvoiceProductListScreen extends StatefulWidget {
  const InvoiceProductListScreen({super.key});

  @override
  State<InvoiceProductListScreen> createState() =>
      _InvoiceProductListScreenState();
}

class _InvoiceProductListScreenState extends State<InvoiceProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Invoice product list screen"),
      ),
    );
  }
}
