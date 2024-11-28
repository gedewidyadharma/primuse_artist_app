import 'package:artist_app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules.dart';

class BookingArtistAvailableListController extends GetxController {
  RegionWebservices regionWebservices = RegionWebservices();
    MainController mainController = Get.find();

   var artists = <Artist>[].obs;
  var isLoading = true.obs;

  var listRegion = <FilterSearch>[].obs;
   var selectedRegion = Rxn<FilterSearch>();
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
    setRegion(listRegion[0]);
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

      listRegion.add(FilterSearch(id: 'all', name: 'all'));
      final cities = region.dashboard
              ?.where((element) => element.code != null && element.name != null)
              .map((element) => FilterSearch(
                    id: element.code!,
                    name: element.name!,
                  ))
              .toList() ??
          [];

      listRegion.addAll(cities);
      setRegion(listRegion[0]);
      // newFetchArtist();
    } catch (e, stackTrace) {
      debugPrint('Error initializing cities: $e');
      debugPrint('Stack trace: $stackTrace');
    }
  }

  void setRegion(FilterSearch? data) {
    selectedRegion.value = data;
    // Tambahkan logika filter disini
  }


  getRegion() async {
    try{
      var resp = regionWebservices.getFilterRegion();
    }catch (e){

    }
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