import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmailFragment extends StatelessWidget {
  const EmailFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Email Fragment",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
