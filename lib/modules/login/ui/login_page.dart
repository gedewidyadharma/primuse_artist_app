import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../widget/widget.dart';
import '../login.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Body(),
    );
  }
}

class _Body extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            Center(
              child: Image.asset(
                'assets/images/logo/primuse_logo_black.png',
                  width: Get.width * 0.5,
                fit: BoxFit.fitWidth,
              ),
            ),
            const Spacer(),
            Text(
              "Login to your Account",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 30),
            TextFieldBorderRounded(
              textController: controller.textEditingControllerEmail,
              label: "Email",
              textInputType: TextInputType.emailAddress,
              onChanged: (value) => controller.onChangeForm(),
            ),
            const SizedBox(height: 30),
            TextFieldBorderRounded(
              textController: controller.textEditingControllerPassword,
              label: "Password",
              onChanged: (value) => controller.onChangeForm(),
              obscureText: controller.isObsecurePassword.value,
              suffixIcon: IconButton(
                icon: Icon(
                  controller.isObsecurePassword.isTrue ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.primary,
                ),
                onPressed: () => controller.onClickObsecurePassword(),
              ),
            ),
            const SizedBox(height: 50),
            ButtonRounded(
              onClick: () => controller.onClickLogin(),
              text: "Sign In",
              color: controller.isAllValid.isTrue ? AppColors.blackPrimary : Colors.black26,
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
