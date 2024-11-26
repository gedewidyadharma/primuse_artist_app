import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../modules.dart';

class HomeController extends GetxController {

    ArtistWebservices artistWebservices = ArtistWebservices();
  var selectedCategory = Rxn<FilterSearch>();
  var selectedCity = Rxn<FilterSearch>();
  

  final categories = [
    FilterSearch(id: 'international', name: 'International', icon: "assets/images/spotify/logo-green.svg"),
    FilterSearch(id: 'national', name: 'Domestic', icon: "assets/images/spotify/logo-green.svg"),
  ];

  final city = [
    FilterSearch(id: 'jkt', name: 'Jakarta'),
    FilterSearch(id: 'sgpr', name: 'Singapore'),
    FilterSearch(id: 'bal', name: 'Bali'),
    FilterSearch(id: 'kllp', name: 'Kuala Lumpur'),
  ];

  var artists = <ArtistRank>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    initData();
    fetchArtists();
  }

  initData(){
    setCategory(categories[0]);
     setCity(city[0]);
  }

  void setCategory(FilterSearch? category) {
    selectedCategory.value = category;
    // Tambahkan logika filter disini
  }

  void setCity(FilterSearch? city) {
    selectedCity.value = city;
    // Tambahkan logika filter disini
  }

    void fetchArtists() async{
    try {
      isLoading(true);
      var resp = await artistWebservices.getTopArtistByCityAndRegion(city: "singapore", region: "international");
            debugPrint("responsesssss ${resp.data}");
      if(resp.statusCode==200){
        artists.addAll(artistRankFromJson(resp.data!));
          debugPrint('Artists list updated: ${artists.length} items');
      }else{

      }
      
    }catch(e){
      debugPrint("error --> $e");
    } 
    finally {
      isLoading(false);
    }
  }

}
