import 'package:flutter/material.dart';

class TaskInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const TaskInputField(
      {super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.blue,
        )),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.blue,
        )),
        hintText: hintText,
      ),
      validator: (value) => value!.isEmpty ? "Enter a value" : null,
    );
  }
}
