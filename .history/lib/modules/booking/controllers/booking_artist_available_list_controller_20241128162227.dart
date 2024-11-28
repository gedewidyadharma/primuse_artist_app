import 'package:artist_app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules.dart';

class BookingArtistAvailableListController extends GetxController {
    ArtistWebservices artistWebservices = ArtistWebservices();
  RegionWebservices regionWebservices = RegionWebservices();
  MainController mainController = Get.find();

  var state = StateStatus.loading.obs;

  var artists = <ArtistsAvailable>[].obs;
  var isLoading = false.obs;

  var listRegion = <FilterSearch>[].obs;
  var selectedRegion = Rxn<FilterSearch>();

  var currentPage = 1.obs;
  var hasMoreData = true.obs;

  @override
  void onInit() {
    super.onInit();
    initRegion();
    initData();
  }

  initData() {
    // setRegion(listRegion[0]);
  }

  Future<void> initRegion() async {
    try {
      if (mainController.filterRegion.value == null) {
        await mainController.getFilterRegion();
      }

      final region = mainController.filterRegion.value;
      if (region == null) {
        return;
      }

      var resp = await regionWebservices.getFilterSubRegion(id: region.avails?.regionsId ?? "", subRegionId: region.avails?.subregionsId ?? "");
      if (resp.statusCode == 200) {
        var dataResp = filterSubRegionFromJson(resp.data!);
        listRegion.clear();

        listRegion.add(FilterSearch(id: 'all', name: 'All'));
        final region = dataResp
                .where((element) => element.iso2 != null && element.name != null)
                .map((element) => FilterSearch(
                      id: element.iso2!,
                      name: element.name!,
                    ))
                .toList() ??
            [];

        listRegion.addAll(region);
        setRegion(listRegion[0]);
      }

      // newFetchArtist();
    } catch (e, stackTrace) {
      debugPrint('Error initializing cities: $e');
      debugPrint('Stack trace: $stackTrace');
    }
  }

  void setRegion(FilterSearch? data) {
    selectedRegion.value = data;
  getMoreArtists();
  }

  Future<void> getMoreArtists() async {
    state.value = artists.isEmpty ? StateStatus.loading : StateStatus.success;
    if (isLoading.value) return;

    isLoading.value = true;

    final newArtists = await fetchArtistsAvailable(page: currentPage.value);
    if (newArtists.isNotEmpty) {
      artists.addAll(newArtists);
      currentPage.value++;
    } else {
      hasMoreData.value = false;
    }

    isLoading.value = false;
  }

  Future<List<ArtistsAvailable>> fetchArtistsAvailable({required int page}) async {
    try {
      var params = {
          "seller" : "primuse",
          "limit" : "10",
          "page" : page.toString()
      };
      var resp = await artistWebservices.getArtistAvailable(country: selectedRegion.value?.id ?? "", queryParams: params);
      if (resp.statusCode == 200) {
        state.value = StateStatus.success;
        return artistsAvailableFromJson(resp.data!);
      } else {
        state.value = artists.isEmpty ? StateStatus.error : StateStatus.success;
        return <ArtistsAvailable>[];
      }
    } catch (e) {
      state.value = artists.isEmpty ? StateStatus.error : StateStatus.success;
      return <ArtistsAvailable>[];
    }
  }
}
