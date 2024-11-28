import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/home.dart';
import '../../modules.dart';

class BookingArtistAvailableListController extends GetxController {
  var selectedCountry = Rxn<FilterSearch>();
    MainController mainController = Get.find();

   var artists = <Artist>[].obs;
  var isLoading = true.obs;

  var listRegion = <FilterSearch>[].obs;
  // final region = [
  //   FilterSearch(id: 'all', name: 'All'),
  //   FilterSearch(id: 'jkt', name: 'China'),
  //   FilterSearch(id: 'sgpr', name: 'Hongkong'),
  //   FilterSearch(id: 'bal', name: 'India'),
  //   FilterSearch(id: 'kllp', name: 'Indonesia'),
  //   FilterSearch(id: 'kllp', name: 'Japan'),
  //   FilterSearch(id: 'kllp', name: 'Macao'),
  // ];

    @override
  void onInit() {
    super.onInit();
    fetchArtists();
    initData();
  }

  initData(){
    setCoutry(listRegion[0]);
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
      listRegion.clear();

      final cities = region.dashboard
              ?.where((element) => element.code != null && element.name != null)
              .map((element) => FilterSearch(
                    id: element.code!,
                    name: element.name!,
                  ))
              .toList() ??
          [];

      listRegion.addAll(cities);
      setCity(listRegion[0]);
      // newFetchArtist();
    } catch (e, stackTrace) {
      debugPrint('Error initializing cities: $e');
      debugPrint('Stack trace: $stackTrace');
    }
  }

  void setCoutry(FilterSearch? data) {
    selectedCountry.value = data;
    // Tambahkan logika filter disini
  }

  void fetchArtists() {
    try {
      isLoading(true);
      artists.value = [
      
      ];
    } finally {
      isLoading(false);
    }
  }
}