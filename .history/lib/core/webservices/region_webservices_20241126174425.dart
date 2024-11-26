

import '../../helper/helper.dart';
import '../core.dart';

class RegionWebservices {


  final StorageSession _storageSession = StorageSession();

  Future<ResponseData> getFilterRegion({required String city, required String region}) async {
    try {
      var token = _storageSession.readTokenJwt();
      var resp = await Api().get(url: AppEndpoint.getTopArtistByCityAndRegion(city: city, region: region), headers: HttpHeader.headersWithAuth(token));
      return resp;
    } catch (e) {
      LoggerHelper.error("fetchArtist error --> $e");
      return ResponseError.defaultError();
    }
  }
}