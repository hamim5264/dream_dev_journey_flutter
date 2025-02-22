import 'dart:typed_data';
import 'package:shared_preferences/shared_preferences.dart';

/// Storing user data to shared preferences
Future<void> writeUserData(userData) async {
  final prefs = await SharedPreferences.getInstance();

  await prefs.setString("token", userData["token"]);
  await prefs.setString("email", userData["data"]["email"]);
  await prefs.setString("firstName", userData["data"]["firstName"]);
  await prefs.setString("lastName", userData["data"]["lastName"]);
  await prefs.setString("mobile", userData["data"]["mobile"]);
  await prefs.setString("photo", userData["data"]["photo"]);
}

/// Storing user mail for mail-verification
Future<void> writeEmailVerification(email) async {
  final pref = await SharedPreferences.getInstance();
  await pref.setString("EmailVerification", email);
}

/// Storing user mail for mail-verification
Future<void> writeOTPVerification(otp) async {
  final pref = await SharedPreferences.getInstance();
  await pref.setString("OTPVerification", otp);
}

/// Reading user data to shared preferences
Future<String?> readUserData(key) async {
  final prefs = await SharedPreferences.getInstance();

  String? userSavedData = prefs.getString(key);
  return userSavedData;
}

/// Remove Token
Future<bool> removeToken() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();
  return true;
}

///Base 64 image
showBase64Image(base64String) {
  UriData? data = Uri.parse(base64String).data;
  Uint8List myImage = data!.contentAsBytes();
  return myImage;
}

///Default profile image
String defaultProfilePic =
    "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/4QAYRXhpZgAASUkqAAgAAAAAAAAAAAAAAP/hAyxodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NDkxMSwgMjAxMy8xMC8yOS0xMTo0NzoxNiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChNYWNpbnRvc2gpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkVFMjc1RkY5MjdENjExRTQ5NUEyOTRGNjZGOEM0NURFIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkVFMjc1RkZBMjdENjExRTQ5NUEyOTRGNjZGOEM0NURFIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6RUUyNzVGRjcyN0Q2MTFFNDk1QTI5NEY2NkY4QzQ1REUiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6RUUyNzVGRjgyN0Q2MTFFNDk1QTI5NEY2NkY4QzQ1REUiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz7/2wBDAAUDBAQEAwUEBAQFBQUGBwwIBwcHBw8LCwkMEQ8SEhEPERET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";
