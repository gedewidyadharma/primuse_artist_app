import 'package:get/get.dart';

import '../../modules.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(HomeController());
    Get.put(ArtistController());
  }
}
