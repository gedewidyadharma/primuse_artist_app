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
      body: SafeArea(
        child: Column(
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
            const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            ),
            const Spacer(),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
