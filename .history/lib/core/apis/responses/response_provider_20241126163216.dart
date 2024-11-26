import 'dart:convert';
import 'package:get/get.dart';

import '../apis.dart';

class ResponseProvider extends GetConnect {
  static ResponseData parse(Response response) {
    try {
      var responseBody = json.decode(response.bodyString!);
      switch (response.statusCode) {
        case 200:
          return ResponseData.fromJson(responseBody);

        default:
          return ResponseData(
            statusCode: response.statusCode,
            message: responseBody['message'],
          );
      }
    } catch (error) {
      return ResponseError.defaultError();
    }
  }
}