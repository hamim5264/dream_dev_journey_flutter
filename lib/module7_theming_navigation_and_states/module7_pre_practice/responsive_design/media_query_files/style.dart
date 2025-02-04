import 'package:flutter/material.dart';

TextStyle headLine(context) {
  var width = MediaQuery.of(context).size.width;
  if (width < 700) {
    /// Mobile/Tab
    return TextStyle(
      color: Colors.red,
      fontSize: 30,
    );
  } else {
    /// Desktop/Web
    return TextStyle(
      color: Colors.green,
      fontSize: 60,
    );
  }
}
