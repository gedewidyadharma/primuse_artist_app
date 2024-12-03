
import 'package:get/get.dart';

import '../../../helper/helper.dart';
import '../../../routes/app_routes.dart';

class SplashController extends GetxController {
  final StorageSession storageSession = StorageSession();

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  initData() async {
    var token = storageSession.readTokenJwt();
    await Future.delayed(const Duration(seconds: 2));
    if (token.isEmpty) {
      Get.toNamed(AppRoutes.login);
    } else {
      Get.toNamed(AppRoutes.main);
    }
  }
}
