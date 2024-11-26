import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/resources/resources.dart';
import '../models/models.dart';

class ArtistController extends GetxController {
  TextEditingController textEditingController = TextEditingController();

  var artists = <ArtistRank>[].obs;
  var isLoading = true.obs;
  var state = StateStatus.success.obs;
  var hasMoreData = true.obs;
  var isShowSubmitSearch = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchArtists();
  }

  onChangedSearch(String keyword){
    if(keyword.isNotEmpty){
      isShowSubmitSearch(true);
    }else{
       isShowSubmitSearch(false);
    }
  }

  onSearchSubmited(){
    debugPrint(textEditingController.text);
  }

  void fetchArtists() {
    try {
      isLoading(true);
      
    } finally {
      isLoading(false);
    }
  }
}
