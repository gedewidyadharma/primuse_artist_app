import 'package:artist_app/widget/widget.dart';
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
  final RxList<SpotifyStatsHistories> dataSpotifyStats = <SpotifyStatsHistories>[].obs;
  final RxList<InstagramStatsHistories> dataInstagramStats = <InstagramStatsHistories>[].obs;
  final RxList<YoutubeStatsHistories> dataYoutubeStats = <YoutubeStatsHistories>[].obs;

  final RxList<UpcomingShow> upcomingShow = <UpcomingShow>[].obs;

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
    getSpotifyStats();
    getInstagramStats();
    getYoutubeStats();
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
        getUpcomingShow(); // place here, for waiting for artist name
      } else {
        DialogMessage(
          onConfirm: () {
            Get.back();
            Get.back();
          },
          message: resp.message!,
        ).show();
      }
    } catch (e) {
      DialogMessage(
        onConfirm: () {
          Get.back();
          Get.back();
        },
        message: "Something went wrong. Please try again in a moment.",
      ).show();
    }
  }

  onClickTicketUpcomingShow() {
    
  }

  void showAllUpcomingShow() {
    UpcomingShowBottomsheet.show(upcomingShow: upcomingShow);
  }

  getUpcomingShow() async {
    try {
      var params = {
        "name": artist.value?.name ?? "",
      };
      var resp = await _artistWebservices.getUpcomingShow(queryParams: params);
      if (resp.statusCode == 200) {
        upcomingShow.value = upcomingShowFromJson(resp.data!);
      }
    } catch (e) {
      debugPrint("error $e");
    }
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
        "offset": "0",
        "limit": "10",
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

  getSpotifyStats() async {
    try {
      var params = {
        "source": "spotify",
        "start_date": "2022-01-10",
      };
      var resp = await _artistWebservices.getStatsPlatform(artistId: artisId!, queryParams: params);
      if (resp.statusCode == 200) {
        var data = spotifyStatsFromJson(resp.data!);
        dataSpotifyStats.addAll(data.historyStats?.data?[0].data?.history ?? []);
      } else {}
    } catch (e) {
      debugPrint("error $e");
    }
  }

  getInstagramStats() async {
    try {
      var params = {
        "source": "instagram",
        "start_date": "2022-01-10",
      };
      var resp = await _artistWebservices.getStatsPlatform(artistId: artisId!, queryParams: params);
      if (resp.statusCode == 200) {
        var data = instagramStatsFromJson(resp.data!);
        dataInstagramStats.addAll(data.historyStats?.data?[0].data?.history ?? []);
      } else {}
    } catch (e) {
      debugPrint("error $e");
    }
  }

  getYoutubeStats() async {
    try {
      var params = {
        "source": "youtube",
        "start_date": "2022-01-10",
      };
      var resp = await _artistWebservices.getStatsPlatform(artistId: artisId!, queryParams: params);
      if (resp.statusCode == 200) {
        var data = youtubeStatsFromJson(resp.data!);
        dataYoutubeStats.addAll(data.historyStats?.data?[0].data?.history ?? []);
      } else {}
    } catch (e) {
      debugPrint("error $e");
    }
  }
}
