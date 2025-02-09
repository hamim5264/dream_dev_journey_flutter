import 'dart:convert';
import 'package:dream_dev_journey_flutter/module11_flutter_rest_api_and_crud_application/module11_pre_practice/crud_app/style/style.dart';
import 'package:http/http.dart' as http;

Future<bool> productCreateRequest(formValues) async {
  var url = Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct");
  var postBody = json.encode(formValues);
  var postHeader = {"Content-Type": "application/json"};

  var response = await http.post(url, headers: postHeader, body: postBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);

  if (resultCode == 200 && resultBody['status'] == 'success') {
    crudSuccessToast("Request success.");
    return true;
  } else {
    crudErrorToast("Request failed! try again.");
    return false;
  }
}

Future<List> productGridViewListRequest() async {
  var url = Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct");
  var postHeader = {"Content-Type": "application/json"};

  var response = await http.get(url, headers: postHeader);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);

  if (resultCode == 200 && resultBody['status'] == 'success') {
    crudSuccessToast("Request success.");
    return resultBody['data'];
  } else {
    crudErrorToast("Request failed! try again.");
    return [];
  }
}

Future<bool> productDeleteRequest(id) async {
  var url = Uri.parse("https://crud.teamrabbil.com/api/v1/DeleteProduct/$id");
  var postHeader = {"Content-Type": "application/json"};

  var response = await http.get(url, headers: postHeader);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);

  if (resultCode == 200 && resultBody['status'] == 'success') {
    crudSuccessToast("Request success.");
    return true;
  } else {
    crudErrorToast("Request failed! try again.");
    return false;
  }
}

Future<bool> productUpdateRequest(formValues, id) async {
  var url = Uri.parse("https://crud.teamrabbil.com/api/v1/UpdateProduct/$id");
  var postBody = json.encode(formValues);
  var postHeader = {"Content-Type": "application/json"};

  var response = await http.post(url, headers: postHeader, body: postBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);

  if (resultCode == 200 && resultBody['status'] == 'success') {
    crudSuccessToast("Request success.");
    return true;
  } else {
    crudErrorToast("Request failed! try again.");
    return false;
  }
}
