import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactFragment extends StatelessWidget {
  const ContactFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Contact Fragment",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
