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

  Future<ResponseData> getStreamingPlatform({required String artistId}) async {
    try {
      var token = _storageSession.readTokenJwt();
      var resp = await Api().get(url: AppEndpoint.getStreamingPlatform(artistId: artistId), headers: HttpHeader.headersWithAuth(token));
      return resp;
    } catch (e) {
      LoggerHelper.error("getStreamingPlatform error --> $e");
      return ResponseError.defaultError();
    }
  }

  Future<ResponseData> getStatsAudience({required String artistId, Map<String, dynamic>? queryParams}) async {
    try {
      var token = _storageSession.readTokenJwt();
      var resp = await Api()
          .get(url: AppEndpoint.getStatsAudience(artistId: artistId), queryParams: queryParams, headers: HttpHeader.headersWithAuth(token));
      return resp;
    } catch (e) {
      LoggerHelper.error("getStatsAudience error --> $e");
      return ResponseError.defaultError();
    }
  }

  Future<ResponseData> getStatsPlatform({required String artistId, Map<String, dynamic>? queryParams}) async {
    try {
      var token = _storageSession.readTokenJwt();
      var resp = await Api()
          .get(url: AppEndpoint.getStatsPlatform(artistId: artistId), queryParams: queryParams, headers: HttpHeader.headersWithAuth(token));
      return resp;
    } catch (e) {
      LoggerHelper.error("getStatsAudience error --> $e");
      return ResponseError.defaultError();
    }
  }

  Future<ResponseData> getUpcomingShow({Map<String, dynamic>? queryParams}) async {
    try {
      var resp = await Api().get(url: AppEndpoint.getUpcomingShow, queryParams: queryParams, headers: HttpHeader.headers);
      return resp;
    } catch (e) {
      LoggerHelper.error("getUpcomingShow error --> $e");
      return ResponseError.defaultError();
    }
  }
}
