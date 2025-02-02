import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CallFragment extends StatelessWidget {
  const CallFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Call Fragment",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
