import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../helper/helper.dart';
import '../artist_details.dart';



class ArtistDetailsController extends GetxController {
  final ArtistWebservices _artistWebservices = ArtistWebservices();
  final RxList<ChartData> dataStreamingPlatform = <ChartData>[].obs;

  var statePlatformDistribution = StateStatus.loading.obs;

  var artist = Rxn<ArtistDetails>();
  // var streamingPlatform = Rxn<StreamingPlatform>();
  final showAppBar = false.obs;
  String? artisId;

  @override
  onInit() {
    fetchData();
    super.onInit();
  }

  initData(){

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
      statePlatformDistribution(StateStatus.loading);
      var resp = await _artistWebservices.getStreamingPlatform(artistId: "399541");
      if (resp.statusCode == 200) {
        var data = streamingPlatformFromJson(resp.data!);
        dataStreamingPlatform.value = ChartDataFormating.convertToChartData(data.stats!);
           statePlatformDistribution(StateStatus.success);
      }else{
         statePlatformDistribution(StateStatus.error);
      }
    } catch (e) {
         statePlatformDistribution(StateStatus.error);
    }
  }
}
