import 'package:flutter/material.dart';

InputDecoration appInputDecoration(label) {
  return InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
    fillColor: Colors.white,
    filled: true,
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.lightGreen,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(
          10,
        ),
      ),
    ),
    labelText: label,
    labelStyle: TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
      color: Colors.lightGreen,
    )),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
      color: Colors.lightGreen,
    )),
  );
}

TextStyle headTextStyle() {
  return TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );
}

ButtonStyle appButtonStyle() {
  return ElevatedButton.styleFrom(
    padding: EdgeInsets.all(
      20,
    ),
    backgroundColor: Colors.lightGreen,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(
          10,
        ),
      ),
    ),
  );
}
