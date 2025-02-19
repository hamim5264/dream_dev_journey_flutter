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

/// Reading user data to shared preferences
Future<String?> readUserData(key) async {
  final prefs = await SharedPreferences.getInstance();

  String? userSavedData = prefs.getString(key);
  return userSavedData;
}
