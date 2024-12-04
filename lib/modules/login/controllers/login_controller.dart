import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../helper/helper.dart';
import '../../../routes/app_routes.dart';
import '../../../widget/widget.dart';
import '../../modules.dart';

class LoginController extends GetxController {
  AuthController authController = Get.find();
  AuthWebservices authWebservices = AuthWebservices();
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();

  final StorageSession _storageSession = StorageSession();

  var isAllValid = false.obs;
  var isObsecurePassword = true.obs;

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

  onClickObsecurePassword() {
    isObsecurePassword.toggle();
  }

  onClickLogin() {
    if (isAllValid.isTrue) {
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
        _storageSession.writeUser(resp.data!);
        authController.user.value = user;
        clearTextController();
        Loading().hide();
        Get.offAllNamed(AppRoutes.main);
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
