import 'package:flutter/material.dart';

InputDecoration appInputDecoration(label) {
  return InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
    border: OutlineInputBorder(),
    focusColor: Colors.lightGreen,
    hoverColor: Colors.lightGreen,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Colors.lightGreen,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Colors.lightGreen,
      ),
    ),
    labelText: label,
  );
}

ButtonStyle appButtonStyle() {
  return ElevatedButton.styleFrom(
    elevation: 0,
    padding: EdgeInsets.all(17),
    backgroundColor: Colors.lightGreen,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );
}

SizedBox sizedBox50(child) {
  return SizedBox(
    height: 50,
    width: double.infinity,
    child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(8),
      child: child,
    ),
  );
}
