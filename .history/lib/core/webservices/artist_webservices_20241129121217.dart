import '../../helper/helper.dart';
import '../core.dart';

class ArtistWebservices {
  final StorageSession _storageSession = StorageSession();

  Future<ResponseData> getTopArtistByCityAndRegion({required String city, required String region, required String page}) async {
    try {
      var token = _storageSession.readTokenJwt();
      var resp = await Api()
          .get(url: AppEndpoint.getTopArtistByCityAndRegion(city: city, region: region, page: page), headers: HttpHeader.headersWithAuth(token));
      return resp;
    } catch (e) {
      LoggerHelper.error("fetchArtist error --> $e");
      return ResponseError.defaultError();
    }
  }

  Future<ResponseData> getArtistList({Map<String, dynamic>? queryParams}) async {
    try {
      var token = _storageSession.readTokenJwt();
      var resp = await Api().get(url: AppEndpoint.artist, queryParams: queryParams, headers: HttpHeader.headersWithAuth(token));
      return resp;
    } catch (e) {
      LoggerHelper.error("fetchArtist error --> $e");
      return ResponseError.defaultError();
    }
  }

  Future<ResponseData> getArtistAvailable({required String country, Map<String, dynamic>? queryParams}) async {
    try {
      var token = _storageSession.readTokenJwt();
      var resp = await Api()
          .get(url: AppEndpoint.getListArtistAvailable(country: country), queryParams: queryParams, headers: HttpHeader.headersWithAuth(token));
      return resp;
    } catch (e) {
      LoggerHelper.error("fetchArtist error --> $e");
      return ResponseError.defaultError();
    }
  }

  Future<ResponseData> getArtistDetails({required String id}) async {
    try {
      var token = _storageSession.readTokenJwt();
      var resp = await Api().get(url: AppEndpoint.getArtistDetails(id: id), headers: HttpHeader.headersWithAuth(token));
      return resp;
    } catch (e) {
      LoggerHelper.error("getArtistDetails error --> $e");
      return ResponseError.defaultError();
    }
  }
}
