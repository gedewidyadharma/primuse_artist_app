import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../main.dart';

class MainController extends GetxController {
  RegionWebservices regionWebservices = RegionWebservices();

  var filterRegion = Rxn<FilterRegion>();

  var currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void changePage(int index) {
    currentIndex.value = index;
  }

  Future<FilterRegion?> getFilterRegion() async {
    try {
      var resp = await regionWebservices.getFilterRegion();
      if (resp.statusCode == 200) {
        filterRegion.value = filterRegionFromJson(resp.data!);
      } else {
        debugPrint('masuk else ${resp.statusCode}');
      }
      return filterRegion.value;
    } catch (e) {
      debugPrint("error --> $e");
      return filterRegion.value;
    }
  }
}
