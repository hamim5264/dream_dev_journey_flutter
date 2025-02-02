import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Home Fragment",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
