
import 'package:get/get.dart';

import '../../../core/core.dart';

class ArtistDetailsController extends GetxController {
  
ArtistWebservices _artistWebservices = ArtistWebservices();





getArtistDetails() async {
  try {
    var resp = await _artistWebservices.getArtistDetails(id: id);
  }
}

}