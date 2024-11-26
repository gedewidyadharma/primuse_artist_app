

import '../../helper/helper.dart';
import '../core.dart';

class ArtistWebservices {


  // final StorageSession storageSession = StorageSession();

  Future<ResponseData> fetchArtist({required String city, required String region}) async {
    try {
      var resp = await Api().get(url: AppEndpoint.getTopArtistByCityAndRegion(city: city, region: region), headers: HttpHeader.headers);
      return resp;
    } catch (e) {
      LoggerHelper.error("fetchArtist error --> $e");
      return ResponseError.defaultError();
    }
  }


}