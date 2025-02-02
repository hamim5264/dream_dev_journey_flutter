import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModeFragment extends StatelessWidget {
  const ModeFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Mode Fragment",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
