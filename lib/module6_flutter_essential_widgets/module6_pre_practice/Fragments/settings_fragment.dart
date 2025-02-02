import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsFragment extends StatelessWidget {
  const SettingsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Settings Fragment",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
