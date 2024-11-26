import 'dart:convert';
import 'package:payshare/modules/modules.dart';
import 'package:payshare/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../localization/app_localization.dart';
import '../api.dart';

class ResponseProvider extends GetConnect {
  static ResponseData? parse(Response response) {
    try {
      var responseBody = json.decode(response.bodyString!);
      switch (response.statusCode) {
        case 200:
          return ResponseData.fromJson(responseBody);

        case 409:
          Loading().hide();
          Handler.onLoginOtherDevice();
          return null;

        default:
          return ResponseData(
            statusCode: responseBody['status_code'],
            message: responseBody['message'],
          );
      }
    } catch (error) {
      debugPrint("ResponseProvider Error --> $error");
      return ResponseError.defaultError();
    }
  }
}

class Handler {
  static void onLoginOtherDevice() {
    late AuthDataMemberController controller;
    try {
      controller = Get.find();
    } catch (e) {
      controller = Get.put(AuthDataMemberController());
    }

    DialogMessage(
        message: Languages.of().sessionAuthExpiredMessage, dissmisable: false, onConfirm: () => controller.logout()).show();
  }
}