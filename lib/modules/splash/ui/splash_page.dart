import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/core.dart';
import '../splash.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Spacer(),
          Image.asset(
             'assets/images/logo/primuse_logo_black.png',
            width: Get.width * 0.35,
            fit: BoxFit.scaleDown,
          ),
          const Expanded(
            child: Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
