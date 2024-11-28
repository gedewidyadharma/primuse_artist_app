

import '../../helper/helper.dart';
import '../core.dart';

class RegionWebservices {


  final StorageSession _storageSession = StorageSession();

  Future<ResponseData> getFilterRegion() async {
    try {
      var token = _storageSession.readTokenJwt();
      var resp = await Api().get(url: AppEndpoint.getFilterRegion, headers: HttpHeader.headersWithAuth(token));
      return resp;
    } catch (e) {
      LoggerHelper.error("getFilterRegion --> $e");
      return ResponseError.defaultError();
    }
  }

  Future<ResponseData> getFilterSubRegion({required String}) async {
    try {
      var token = _storageSession.readTokenJwt();
      var resp = await Api().get(url: AppEndpoint.getFilterRegionById(id: id, subRegionId: subRegionId), headers: HttpHeader.headersWithAuth(token));
      return resp;
    } catch (e) {
      LoggerHelper.error("getFilterRegion --> $e");
      return ResponseError.defaultError();
    }
  }
}