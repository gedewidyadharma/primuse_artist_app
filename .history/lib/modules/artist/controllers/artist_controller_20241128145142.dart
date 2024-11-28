
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/core.dart';
import '../../../core/resources/resources.dart';
import '../models/models.dart';

class ArtistController extends GetxController {
  
  ArtistWebservices artistWebservices = ArtistWebservices();

  TextEditingController textEditingController = TextEditingController();

  var artists = <Artist>[].obs;
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
    fetchArtists();
  }
  

  void fetchArtists() async{
    try {
      isLoading(true);
      var resp = await artistWebservices.getArtistList(keyword: textEditingController.text.length> 3 ? textEditingController.text : "tay");
      if(resp.statusCode==200){
        artists.addAll(artistFromJson(resp.data!));
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
