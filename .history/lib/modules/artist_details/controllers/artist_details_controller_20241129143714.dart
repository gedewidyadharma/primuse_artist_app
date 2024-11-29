import 'package:get/get.dart';

import '../../../core/core.dart';
import '../artist_details.dart';

class ChartData {
  final String category;
  final double value;

  ChartData({
    required this.category,
    required this.value,
  });
}

class ArtistDetailsController extends GetxController {
  final ArtistWebservices _artistWebservices = ArtistWebservices();
    final RxList<ChartData> chartDataListener = <ChartData>[].obs;

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
          description: artist.value?.bio ?? "",
          
        ),
        isScrollControlled: true,
      );
  }
}
