
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../artist_details.dart';

class ArtistDetailsController extends GetxController {
  
ArtistWebservices _artistWebservices = ArtistWebservices();

var artist = Rxn<ArtistDetails>();



getArtistDetails() async {
  try {
    var resp = await _artistWebservices.getArtistDetails(id: "399541");
    if(resp.statusCode ==200){
      artist.value = 
    }
  }catch (e){

  }
}

}