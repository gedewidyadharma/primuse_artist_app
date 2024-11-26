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

  final categories = [
    FilterSearch(id: 'international', name: 'International', icon: "assets/images/spotify/logo-green.svg"),
    FilterSearch(id: 'national', name: 'Domestic', icon: "assets/images/spotify/logo-green.svg"),
  ];

  // final city = [
  //   FilterSearch(id: 'jkt', name: 'Jakarta'),
  //   FilterSearch(id: 'sgpr', name: 'Singapore'),
  //   FilterSearch(id: 'bal', name: 'Bali'),
  //   FilterSearch(id: 'kllp', name: 'Kuala Lumpur'),
  // ];

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
        debugPrint('Filter region is null, fetching data...');
        await mainController.getFilterRegion();
      }

      final region = mainController.filterRegion.value;
      if (region == null) {
        debugPrint('Failed to initialize region');
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

  void fetchArtists() async {
    try {
      isLoading(true);
      var resp = await artistWebservices.getTopArtistByCityAndRegion(city: selectedCity.value?.id ?? "", region: selectedCategory.value?.id ?? "international");
      if (resp.statusCode == 200) {
        artists.addAll(artistRankFromJson(resp.data!));
      } else {}
    } catch (e) {
    } finally {
      isLoading(false);
    }
  }
}
