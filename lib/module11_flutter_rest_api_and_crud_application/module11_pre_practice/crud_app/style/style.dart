import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

const colorRed = Color.fromRGBO(231, 28, 36, 1);
const colorGreen = Color.fromRGBO(33, 191, 115, 1);
const colorWhite = Color.fromRGBO(255, 255, 255, 1);
const colorDarkBlue = Color.fromRGBO(44, 62, 80, 1);

InputDecoration crudAppInputDecoration(label){
  return InputDecoration(
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: colorGreen, width: 1,),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: colorWhite, width: 0,),
    ),
    border: const OutlineInputBorder(),
    fillColor: colorWhite,
    filled: true,
    contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
    labelText: label,
  );
}

SvgPicture crudScreenBackground(context){
  return SvgPicture.asset(
    "images/screen-back.svg",
    alignment: Alignment.center,
    width: MediaQuery.sizeOf(context).width,
    height: MediaQuery.sizeOf(context).height,
    fit: BoxFit.cover,
  );
}

DecoratedBox crudAppDropDownStyle(child){
  return DecoratedBox(
      decoration: BoxDecoration(
        color: colorWhite,
        border: Border.all(color: colorWhite, width: 1,),
        borderRadius: BorderRadius.circular(4),
      ),
    child: Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
      child: child,
    ),
  );
}

ButtonStyle crudAppButtonStyle(){
  return ElevatedButton.styleFrom(
    elevation: 1,
    padding: EdgeInsets.all(0),
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
  );
}

Ink crudAppSuccessButtonChild(buttonText){
  return Ink(
    decoration: BoxDecoration(
      color: colorGreen,
      borderRadius: BorderRadius.circular(4),
    ),
    child: Container(
      height: 50,
      alignment: Alignment.center,
      child: Text(buttonText, style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: Colors.white,
      ),),
    ),
  );
}

SliverGridDelegateWithFixedCrossAxisCount crudProductGridViewStyle(){
  return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
    mainAxisExtent: 250,
    mainAxisSpacing: 2,
  );
}

void crudErrorToast(msg){
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: colorRed,
    textColor: colorWhite,
    fontSize: 16,
  );
}

void crudSuccessToast(msg){
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: colorGreen,
    textColor: colorWhite,
    fontSize: 16,
  );
}