

import 'package:get/get.dart';

class ArtistDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(HomeController());
    Get.put(ArtistController());
    Get.put(BookingArtistAvailableListController());
  }
}
