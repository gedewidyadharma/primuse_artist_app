import 'package:artist_app/routes/app_routes.dart';
import 'package:get/get.dart';

import '../../../helper/helper.dart';
import '../../../widget/widget.dart';
import '../../modules.dart';

class AuthController extends GetxController {
  final StorageSession storageSession = StorageSession();
  final user = Rxn<User>();

  @override
  onInit() async {
    // checkSession();
    // await checkRefreshToken();
    // fetchProfile();
    super.onInit();
  }

  doLogout() {
    storageSession.clearUser();
    storageSession.clearTokenJwt();
    Get.offAllNamed(AppRoutes.login);
  }

  doLogoutWithMessage() {
    DialogMessage(
      message: "Are you sure want to Sign Out?",
      onCancel: () => Get.back(),
      onConfirm: () {
        Get.back();
        doLogout();
      },
    ).show();
  }
}
