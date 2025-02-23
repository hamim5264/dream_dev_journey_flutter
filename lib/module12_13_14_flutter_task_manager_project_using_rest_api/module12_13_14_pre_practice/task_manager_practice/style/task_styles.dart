import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

/// Color Gradients
const colorRed = Color.fromRGBO(231, 28, 36, 1);
const colorDark = Color.fromRGBO(136, 28, 32, 1);
const colorGreen = Color.fromRGBO(33, 191, 115, 1);
const colorBlue = Color.fromRGBO(52, 152, 219, 1);
const colorOrange = Color.fromRGBO(230, 126, 34, 1);
const colorWhite = Color.fromRGBO(255, 255, 255, 1);
const colorDarkBlue = Color.fromRGBO(44, 62, 80, 1);
const colorLightGray = Color.fromRGBO(135, 142, 150, 1);
const colorLight = Color.fromRGBO(211, 211, 211, 1);

/// Title Text Style
TextStyle head1Text(textColor) {
  return TextStyle(
    color: textColor,
    fontSize: 28,
    fontFamily: "poppins",
    fontWeight: FontWeight.w700,
  );
}

/// Description Text Style 1
TextStyle head6Text(textColor) {
  return TextStyle(
    color: textColor,
    fontSize: 16,
    fontFamily: "poppins",
    fontWeight: FontWeight.w400,
  );
}

/// Description Text Style 2
TextStyle head8Text(textColor) {
  return TextStyle(
    color: textColor,
    fontSize: 9,
    fontFamily: "poppins",
    fontWeight: FontWeight.w400,
  );
}

/// Inkwell Text Style
TextStyle head7Text(textColor) {
  return TextStyle(
    color: textColor,
    fontSize: 13,
    fontFamily: "poppins",
    fontWeight: FontWeight.w400,
  );
}

/// TextFormField Style
InputDecoration taskAppInputDecoration(label) {
  return InputDecoration(
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: colorGreen,
        width: 1,
      ),
    ),
    fillColor: colorWhite,
    filled: true,
    contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: colorWhite,
        width: 0.0,
      ),
    ),
    border: const OutlineInputBorder(),
    labelText: label,
  );
}

/// DropDown Style
DecoratedBox taskAppDropDownStyle(child) {
  return DecoratedBox(
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: Colors.white,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(4),
    ),
    child: Padding(
      padding: EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      child: child,
    ),
  );
}

/// Screen Background Style
SvgPicture taskAppScreenBackground(context) {
  return SvgPicture.asset(
    "images/task_background.svg",
    alignment: Alignment.center,
    width: MediaQuery.sizeOf(context).width,
    height: MediaQuery.sizeOf(context).height,
    fit: BoxFit.cover,
  );
}

/// Button Style
ButtonStyle taskAppButtonStyle() {
  return ElevatedButton.styleFrom(
    elevation: 1,
    padding: EdgeInsets.zero,
    //backgroundColor: Colors.transparent,
    backgroundColor: colorGreen,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6),
    ),
  );
}

/// Button Text Style
TextStyle taskAppButtonTextStyle() {
  return TextStyle(
    fontSize: 14,
    fontFamily: "poppins",
    fontWeight: FontWeight.w400,
    color: colorWhite,
  );
}

/// Success Button Style
Ink taskAppSuccessButtonChild(String buttonText) {
  return Ink(
    decoration: BoxDecoration(
      color: colorGreen,
      borderRadius: BorderRadius.circular(6),
    ),
    child: Container(
      height: 45,
      alignment: Alignment.center,
      child: Text(
        buttonText,
        style: taskAppButtonTextStyle(),
      ),
    ),
  );
}

/// Success Toast Message
void taskAppSuccessToast(msg) {
  Fluttertoast.showToast(
    msg: msg,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    toastLength: Toast.LENGTH_SHORT,
    backgroundColor: colorGreen,
    textColor: colorWhite,
    fontSize: 16.0,
  );
}

/// Error Toast Message
void taskAppErrorToast(msg) {
  Fluttertoast.showToast(
    msg: msg,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    toastLength: Toast.LENGTH_SHORT,
    backgroundColor: colorRed,
    textColor: colorWhite,
    fontSize: 16.0,
  );
}

PinTheme taskOTPStyle() {
  return PinTheme(
    inactiveColor: colorLight,
    inactiveFillColor: colorWhite,
    selectedColor: colorGreen,
    activeColor: colorWhite,
    selectedFillColor: colorGreen,
    shape: PinCodeFieldShape.box,
    borderRadius: BorderRadius.circular(5),
    fieldHeight: 50,
    borderWidth: 0.5,
    fieldWidth: 40,
    activeFillColor: Colors.white,
  );
}

/// Task List Card View
SizedBox taskItemSizedBox(child) {
  return SizedBox(
    width: double.infinity,
    child: Container(
      padding: EdgeInsets.all(10),
      child: child,
    ),
  );
}

/// Status Child
Container statusChild(statusText, statusColor) {
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: statusColor),
    height: 20,
    width: 60,
    child: Text(
      statusText,
      style: TextStyle(
        color: Colors.white,
        fontSize: 10,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}

/// App StatusButtonStyle
ButtonStyle appStatusButtonStyle(buttonColor) {
  return ElevatedButton.styleFrom(
    elevation: 1,
    padding: EdgeInsets.zero,
    backgroundColor: buttonColor,
  );
}
