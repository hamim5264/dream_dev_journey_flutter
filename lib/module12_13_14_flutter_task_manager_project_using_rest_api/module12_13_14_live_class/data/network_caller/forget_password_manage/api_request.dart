import 'dart:convert';
import 'package:http/http.dart' as http;

var baseURL = "https://task.teamrabbil.com/api/v1";
var requestHeader = {"Content-Type": "application/json"};

///Set new password request
Future<bool> setPasswordRequest(formValues) async {
  var url = Uri.parse("$baseURL/RecoverResetPass");
  var postBody = json.encode(formValues);
  var response = await http.post(url, headers: requestHeader, body: postBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200 && resultBody['status'] == "success") {
    return true;
  } else {
    return false;
  }
}
