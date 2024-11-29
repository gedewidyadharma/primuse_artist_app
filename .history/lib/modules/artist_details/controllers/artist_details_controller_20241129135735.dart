import 'package:get/get.dart';

import '../../../core/core.dart';
import '../artist_details.dart';

class ArtistDetailsController extends GetxController {
  final ArtistWebservices _artistWebservices = ArtistWebservices();

  var artist = Rxn<ArtistDetails>();
  final showAppBar = false.obs;

  @override
  onInit() {
    fetchData();
    super.onInit();
  }



  fetchData() {
    getArtistDetails();
  }

  getArtistDetails() async {
    try {
      var resp = await _artistWebservices.getArtistDetails(id: "399541");
      if (resp.statusCode == 200) {
        artist.value = artistsDetailsFromJson(resp.data!);
      }
    } catch (e) {}
  }

  showArtistBio(){
    Get.bottomSheet(
        ArtistDescriptionSheet(
          
        ),
        isScrollControlled: true,
      );
  }
}
