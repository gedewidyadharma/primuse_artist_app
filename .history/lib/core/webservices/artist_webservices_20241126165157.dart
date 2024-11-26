

import 'package:flutter/material.dart';

import '../../helper/helper.dart';
import '../core.dart';

class ArtistWebservices {

  final StorageSession _storageSession = StorageSession();

  Future<ResponseData> getTopArtistByCityAndRegion({required String city, required String region}) async {
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