import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../apis.dart';

class ResponseProvider extends GetConnect {
  static ResponseData parse(Response response) {
    try {
      var responseBody = json.decode(response.bodyString!);
      switch (response.statusCode) {
        case 200:
          return ResponseData(
            statusCode: response.statusCode,
            message: responseBody['message'],
            data:  json.encode(responseBody['data'] ?? responseBody['user']),
          );

        default:
          return ResponseData(
            statusCode: response.statusCode,
            message: responseBody['message'],
          );
      }
    } catch (error) {
       debugPrint("ResponseProvider error --> $error");
      return ResponseError.defaultError();
    }
  }
}
