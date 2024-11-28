

import '../../helper/helper.dart';
import '../core.dart';

class ArtistWebservices {

  final StorageSession _storageSession = StorageSession();

  Future<ResponseData> getTopArtistByCityAndRegion({required String city, required String region, required String page}) async {
    try {
      var token = _storageSession.readTokenJwt();
      var resp = await Api().get(url: AppEndpoint.getTopArtistByCityAndRegion(city: city, region: region, page: page), headers: HttpHeader.headersWithAuth(token));
      return resp;
    } catch (e) {
      LoggerHelper.error("fetchArtist error --> $e");
      return ResponseError.defaultError();
    }
  }

    Future<ResponseData> getArtistList({required String keyword}) async {
    try {
      var token = _storageSession.readTokenJwt();
      var resp = await Api().get(url: AppEndpoint.getListArtist(keyword: keyword), headers: HttpHeader.headersWithAuth(token));
      return resp;
    } catch (e) {
      LoggerHelper.error("fetchArtist error --> $e");
      return ResponseError.defaultError();
    }
  }
}