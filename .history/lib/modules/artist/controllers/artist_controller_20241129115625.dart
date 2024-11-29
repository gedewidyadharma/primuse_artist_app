import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/core.dart';
import '../models/models.dart';

class ArtistController extends GetxController {
  ArtistWebservices artistWebservices = ArtistWebservices();

  TextEditingController textEditingController = TextEditingController();

  var artists = <Artist>[].obs;
  var isLoading = false.obs;
  var state = StateStatus.success.obs;
  var hasMoreData = true.obs;
  var isShowSubmitSearch = false.obs;
  var currentPage = 1.obs;

  @override
  void onInit() {
    super.onInit();
    getMoreArtists();
  }

  onChangedSearch(String keyword) {
    if (keyword.isNotEmpty) {
      isShowSubmitSearch(true);
    } else {
      isShowSubmitSearch(false);
    }
  }

  onSearchSubmited() {
    currentPage.value = 1;
    hasMoreData.value = true;
    artists.clear();
    getMoreArtists();
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

  Future<List<Artist>> fetchArtist({required int page}) async {
    try {
      var params = {"page": currentPage.toString(), "limit": "30"};

      if (textEditingController.text.isNotEmpty) {
        params["q"] = textEditingController.text;
      }

      var resp = await artistWebservices.getArtistList(queryParams: params);
      if (resp.statusCode == 200) {
        var listArtis = artistFromJson(resp.data!);
        state.value = StateStatus.success;
        return listArtis;
      } else {
        state.value = artists.isEmpty ? StateStatus.error : StateStatus.success;
        return <Artist>[];
      }
    } catch (e) {
      debugPrint(" error -> $e");
      state.value = artists.isEmpty ? StateStatus.error : StateStatus.success;
      return <Artist>[];
    }
  }

  // void fetchArtists() async{
  //   try {
  //     isLoading(true);

  //     var resp = await artistWebservices.getArtistList();
  //     if(resp.statusCode==200){
  //       artists.addAll(artistFromJson(resp.data!));
  //     }else{

  //     }

  //   }catch(e){
  //     debugPrint("error --> $e");
  //   }
  //   finally {
  //     isLoading(false);
  //   }
  // }
}
