import 'package:get/get.dart';

import '../../../core/core.dart';

class MainController extends GetxController {
  
  RegionWebservices regionWebservices = RegionWebservices();

  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }


  getFilterRegion() async {
    
  }
}