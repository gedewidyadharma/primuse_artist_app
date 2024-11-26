

import 'package:get/get.dart';

import '../artist_details.dart';

class ArtistDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ArtistDetailsController());
  }
}
