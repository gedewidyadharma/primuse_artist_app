import 'package:get/get.dart';

import '../../../helper/helper.dart';
import '../../../routes/app_routes.dart';
import '../../auth/auth.dart';

class SplashController extends GetxController {
  final StorageSession storageSession = StorageSession();
  AuthController authController = Get.find();

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  initData() async {
    var token = storageSession.readTokenJwt();
    var user = storageSession.readUser();
    await Future.delayed(const Duration(seconds: 2));
    if (token.isNotEmpty && user.isNotEmpty) {
      authController.user.value = userFromJson(user);
      Get.offAllNamed(AppRoutes.main);
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }
}
