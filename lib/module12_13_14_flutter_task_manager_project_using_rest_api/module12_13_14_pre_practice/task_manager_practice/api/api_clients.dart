import 'dart:convert';
import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_pre_practice/task_manager_practice/style/task_styles.dart';
import 'package:dream_dev_journey_flutter/module12_13_14_flutter_task_manager_project_using_rest_api/module12_13_14_pre_practice/task_manager_practice/utility/task_utilities.dart';
import 'package:http/http.dart' as http;

var baseURL = "https://task.teamrabbil.com/api/v1";
var requestHeader = {"Content-Type": "application/json"};

/// Login Request
Future<bool> logInRequest(formValues) async {
  var url = Uri.parse("$baseURL/login");
  var postBody = json.encode(formValues);
  var response = await http.post(url, headers: requestHeader, body: postBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);

  if (resultCode == 200 && resultBody["status"] == "success") {
    taskAppSuccessToast("Request Success");
    await writeUserData(resultBody);
    return true;
  } else {
    taskAppErrorToast("Request fail, try again!");
    return false;
  }
}

/// Registration Request
Future<bool> registrationRequest(formValues) async {
  var url = Uri.parse("$baseURL/registration");
  var postBody = json.encode(formValues);
  var response = await http.post(url, headers: requestHeader, body: postBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);

  if (resultCode == 200 && resultBody["status"] == "success") {
    taskAppSuccessToast("Request Success");
    return true;
  } else {
    taskAppErrorToast("Request fail, try again!");
    return false;
  }
}

/// Verify Email Request
Future<bool> verifyEmailRequest(email) async {
  var url = Uri.parse("$baseURL/RecoverVerifyEmail/$email");

  var response = await http.get(url, headers: requestHeader);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);

  if (resultCode == 200 && resultBody["status"] == "success") {
    await writeEmailVerification(email);
    taskAppSuccessToast("Request Success");
    return true;
  } else {
    taskAppErrorToast("Request fail, try again!");
    return false;
  }
}

/// Verify OTP Request
Future<bool> verifyOTPRequest(email, otp) async {
  var url = Uri.parse("$baseURL/RecoverVerifyOTP/$email/$otp");

  var response = await http.get(url, headers: requestHeader);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);

  if (resultCode == 200 && resultBody["status"] == "success") {
    await writeOTPVerification(otp);
    taskAppSuccessToast("Request Success");
    return true;
  } else {
    taskAppErrorToast("Request fail, try again!");
    return false;
  }
}

/// Set New Password Request
Future<bool> setPasswordRequest(formValues) async {
  var url = Uri.parse("$baseURL/RecoverResetPass");
  var postBody = json.encode(formValues);
  var response = await http.post(url, headers: requestHeader, body: postBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200 && resultBody['status'] == "success") {
    taskAppErrorToast("Request Success");
    return true;
  } else {
    taskAppErrorToast("Request failed, try again!");
    return false;
  }
}

/// List Task by Status
Future<List> taskListByStatusRequest(status) async {
  var url = Uri.parse("$baseURL/listTaskByStatus/$status");

  String? token = await readUserData("token");
  var requestHeaderWithToken = {
    "Content-Type": "application/json",
    "token": "$token"
  };
  var response = await http.get(url, headers: requestHeaderWithToken);

  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200 && resultBody["status"] == "success") {
    taskAppSuccessToast("Request Success.");
    return resultBody["data"];
  } else {
    taskAppErrorToast("Request failed, try again!");
    return [];
  }
}
