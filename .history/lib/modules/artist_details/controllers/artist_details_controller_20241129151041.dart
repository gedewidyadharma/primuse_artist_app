import 'package:get/get.dart';

import '../../../core/core.dart';
import '../artist_details.dart';



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
    getStreamingPlatform();
  }

  showArtistBio() {
    Get.bottomSheet(
      ArtistDescriptionSheet(
        description: artist.value?.bio ?? "",
      ),
      isScrollControlled: true,
    );
  }

  getArtistDetails() async {
    try {
      var resp = await _artistWebservices.getArtistDetails(id: "399541");
      if (resp.statusCode == 200) {
        artist.value = artistsDetailsFromJson(resp.data!);
      }
    } catch (e) {}
  }

  getStreamingPlatform() async {
    try {
      var resp = await _artistWebservices.getStreamingPlatform(artistId: "399541");
      if (resp.statusCode == 200) {
        artist.value = streamingPlatformFromJson(resp.data!);
      }
    } catch (e) {}
  }
}
