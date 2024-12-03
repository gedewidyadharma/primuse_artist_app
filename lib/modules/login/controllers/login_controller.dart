import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../helper/helper.dart';
import '../../../routes/app_routes.dart';
import '../../../widget/widget.dart';
import '../../modules.dart';

class LoginController extends GetxController {

  AuthWebservices  authWebservices = AuthWebservices();
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();

    final StorageSession _storageSession = StorageSession();

  var isAllValid = false.obs;

  onChangeForm() {
    if (textEditingControllerEmail.text.isNotEmpty && textEditingControllerPassword.text.isNotEmpty) {
      isAllValid.value = true;
    } else {
      isAllValid.value = false;
    }
  }

   clearTextController() {
    textEditingControllerEmail.clear();
    textEditingControllerPassword.clear();
  }

  onClickLogin(){
    if(isAllValid.isTrue){
      doLogin();
    }
  }

  doLogin() async {
    Loading().show();
    try {
      var data = {
        "email": textEditingControllerEmail.text,
        "password": textEditingControllerPassword.text,
      };

      var resp = await authWebservices.login(data);
      if (resp.statusCode == 200) {
        var user = userFromJson(resp.data!);
        _storageSession.writeTokenJwt(user.token!);
        clearTextController();
        Loading().hide();
        Get.offNamed(AppRoutes.main);
      } else {
        Loading().hide();
        DialogMessage(message: resp.message!).show();
      }
    } catch (e) {
      Loading().hide();
      const DialogMessage(message: "Something went wrong. Please try again in a moment.").show();
    }
  }
}
