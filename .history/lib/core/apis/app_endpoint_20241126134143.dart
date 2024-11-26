

import '../core.dart';

class AppEndpoint {
  static String base = Env.baseApiUrl;

  static String url = "$base/api";
  
  //==================== Artist ====================//
  static String artist = '$url/artist';

  static String getTopArtistByCityAndRegion({required String city, required String region}) => '$artist/top/$city/$region?limit=20&offset=20';
}