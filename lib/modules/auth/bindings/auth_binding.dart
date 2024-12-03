
import 'package:get/get.dart';

import '../auth.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
  }
}