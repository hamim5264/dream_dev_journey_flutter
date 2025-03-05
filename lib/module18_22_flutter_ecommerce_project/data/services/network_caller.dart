import 'dart:convert';
import 'dart:developer';

import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/data/models/response_data.dart';
import 'package:http/http.dart';

class NetworkCaller {
  Future<ResponseData> getRequest(String url) async {
    log(url);
    final Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      final decodeResponse = jsonDecode(response.body);
      log(response.statusCode.toString());
      log(response.body.toString());
      if (decodeResponse["msg"] == "success") {
        return ResponseData(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: decodeResponse,
        );
      } else {
        return ResponseData(
          isSuccess: false,
          statusCode: response.statusCode,
          responseData: decodeResponse,
          errorMessage: decodeResponse["data"] ?? "Something went wrong!",
        );
      }
    } else {
      return ResponseData(
        isSuccess: false,
        statusCode: response.statusCode,
        responseData: "",
      );
    }
  }

  Future<ResponseData> postRequest(String url,
      {Map<String, dynamic>? body}) async {
    log(url);
    log(body.toString());
    final Response response =
        await post(Uri.parse(url), body: jsonEncode(body));
    if (response.statusCode == 200) {
      final decodeResponse = jsonDecode(response.body);
      log(response.statusCode.toString());
      log(response.body.toString());
      if (decodeResponse["msg"] == "success") {
        return ResponseData(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: decodeResponse,
        );
      } else {
        return ResponseData(
          isSuccess: false,
          statusCode: response.statusCode,
          responseData: decodeResponse,
          errorMessage: decodeResponse["data"] ?? "Something went wrong!",
        );
      }
    } else {
      return ResponseData(
        isSuccess: false,
        statusCode: response.statusCode,
        responseData: "",
      );
    }
  }
}
