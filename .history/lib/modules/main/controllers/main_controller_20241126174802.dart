import 'package:get/get.dart';

import '../../../core/core.dart';

class MainController extends GetxController {
  
  RegionWebservices regionWebservices = RegionWebservices();

  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }

   void getFilterRegion() async{
    try {
     
      var resp = await regionWebservices.getFilterRegion(); debugPrint("responsesssss ${resp.data}");
      if(resp.statusCode==200){
        artists.addAll(artistRankFromJson(resp.data!));
          debugPrint('Artists list updated: ${artists.length} items');
      }else{
          debugPrint('masuk else ${resp.statusCode}');
      }
      
    }catch(e){
      debugPrint("error --> $e");
    } 
    finally {
      isLoading(false);
    }
  }
}