import 'package:flutter/material.dart';
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
     
      var resp = await regionWebservices.getFilterRegion();
      if(resp.statusCode==200){
       
      }else{
          debugPrint('masuk else ${resp.statusCode}');
      }
      
    }catch(e){
      debugPrint("error --> $e");
    } 
    finally {
    }
  }
}