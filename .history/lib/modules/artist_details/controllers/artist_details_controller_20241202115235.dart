import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../helper/helper.dart';
import '../artist_details.dart';

class ArtistDetailsController extends GetxController {
  final ArtistWebservices _artistWebservices = ArtistWebservices();
  final RxList<ChartData> dataStreamingPlatform = <ChartData>[].obs;

  var statePlatformDistribution = StateStatus.loading.obs;

  var artist = Rxn<ArtistDetails>();
  final showAppBar = false.obs;
  String? artisId;

  @override
  onInit() {
    initData();
    super.onInit();
  }

  initData() {
    artisId = Get.arguments.toString();

    if (artisId != null) {
      fetchData();
    }
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
      var resp = await _artistWebservices.getArtistDetails(id: artisId!);
      if (resp.statusCode == 200) {
        artist.value = artistsDetailsFromJson(resp.data!);
      }
    } catch (e) {}
  }

  getStreamingPlatform() async {
    try {
      statePlatformDistribution(StateStatus.loading);
      var resp = await _artistWebservices.getStreamingPlatform(artistId: artisId!);
      if (resp.statusCode == 200) {
        var data = streamingPlatformFromJson(resp.data!);
        dataStreamingPlatform.value = ChartDataFormating.convertToChartData(data.stats!);
        statePlatformDistribution(StateStatus.success);
      } else {
        statePlatformDistribution(StateStatus.error);
      }
    } catch (e) {
      debugPrint("error $e");
      statePlatformDistribution(StateStatus.error);
    }
  }

  getStatsAudience() async {
        try {
      statePlatformDistribution(StateStatus.loading);
      var resp = await _artistWebservices.getStreamingPlatform(artistId: artisId!);
      if (resp.statusCode == 200) {
        var data = statsAudienceFromJson(resp.data!);
        if((data.audience ?? []).isNotEmpty){
          setupMonthlyListener(data.audience?.first.data?.monthlyListeners ?? []);
        }
      } else {
      }
    } catch (e) {
      debugPrint("error $e");
    }
  }


  setupMonthlyListener(List<MonthlyListener> audience){

  }

  setupTopCountries(List<>){

  }
}