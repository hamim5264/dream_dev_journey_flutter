import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlarmFragment extends StatelessWidget {
  const AlarmFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Alarm Fragment",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
