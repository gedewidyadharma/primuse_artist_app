import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../helper/helper.dart';
import '../artist_details.dart';

class ArtistDetailsController extends GetxController {
  final ArtistWebservices _artistWebservices = ArtistWebservices();
  final RxList<ChartData> dataStreamingPlatform = <ChartData>[].obs;

  final RxList<MonthlyListener> dataMonthlyListener = <MonthlyListener>[].obs;
  final RxList<CountryChart> dataTopCountries = <CountryChart>[].obs;

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
    getStatsAudience();
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
      var params = {
          "source": "spotify",
          "offset" : "0",
          "limit" : "10",
      };
      var resp = await _artistWebservices.getStatsAudience(artistId: artisId!, queryParams: params);
      if (resp.statusCode == 200) {
        var data = statsAudienceFromJson(resp.data!);
        if ((data.audience ?? []).isNotEmpty) {
          setupMonthlyListener(data.audience!.first);
          setupTopCountries(data.audience!.first);
        }
      } else {}
    } catch (e) {
      debugPrint("error $e");
    }
  }

  setupMonthlyListener(Audience audience) {
    List<MonthlyListener> monthlyListeners = audience.data?.monthlyListeners ?? [];
    if (monthlyListeners.isNotEmpty) {
      dataMonthlyListener.clear();
      dataMonthlyListener.addAll(monthlyListeners);
    }
  }

  setupTopCountries(Audience audience) {
    List<CountryChart> countryCharts = audience.data?.countryCharts ?? [];
    if (countryCharts.isNotEmpty) {
      dataTopCountries.clear();
      dataTopCountries.addAll(countryCharts);
    }
  }
}
