import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../modules.dart';

class HomeController extends GetxController {
  ArtistWebservices artistWebservices = ArtistWebservices();
  MainController mainController = Get.find();
  var city = <FilterSearch>[].obs;
  var selectedCategory = Rxn<FilterSearch>();
  var selectedCity = Rxn<FilterSearch>();

  var state = StateStatus.loading.obs;
  var currentPage = 1.obs;
  var hasMoreData = true.obs;

  final categories = [
    FilterSearch(id: 'international', name: 'International', icon: "assets/images/spotify/logo-green.svg"),
    FilterSearch(id: 'national', name: 'Domestic', icon: "assets/images/spotify/logo-green.svg"),
  ];

  var artists = <ArtistRank>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  initData() {
    setCategory(categories[0]);
    initCity();
  }

  Future<void> initCity() async {
    try {
      if (mainController.filterRegion.value == null) {
        await mainController.getFilterRegion();
      }

      final region = mainController.filterRegion.value;
      if (region == null) {
        return;
      }
      city.clear();

      final cities = region.dashboard
              ?.where((element) => element.code != null && element.name != null)
              .map((element) => FilterSearch(
                    id: element.code!,
                    name: element.name!,
                  ))
              .toList() ??
          [];

      city.addAll(cities);
      setCity(city[0]);
      fetchArtists();
    } catch (e, stackTrace) {
      debugPrint('Error initializing cities: $e');
      debugPrint('Stack trace: $stackTrace');
    }
  }

  void setCategory(FilterSearch? category) {
    selectedCategory.value = category;
    fetchArtists();
  }

  void setCity(FilterSearch? city) {
    selectedCity.value = city;
    fetchArtists();
  }

  Future<void> getMoreArtists() async {
    state.value = artists.isEmpty ? StateStatus.loading : StateStatus.success;
    if (isLoading.value) return;

    isLoading.value = true;

    final newArtists = await fetchArtist(page: currentPage.value);
    if (newArtists.isNotEmpty) {
      artists.addAll(newArtists);
      currentPage.value++;
    } else {
      hasMoreData.value = false;
    }

    isLoading.value = false;
  }

   Future<List<Artist>> fetchArtists() async {
    try {
      isLoading(true);
      var resp = await artistWebservices.getTopArtistByCityAndRegion(
          city: selectedCity.value?.id ?? "", region: selectedCategory.value?.id ?? "international", page: currentPage.value);
      if (resp.statusCode == 200) {
        artists.addAll(artistRankFromJson(resp.data!));
      } else {}
    } catch (e) {
    } finally {
      isLoading(false);
    }
  }
}
