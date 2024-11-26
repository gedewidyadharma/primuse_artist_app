

import '../core.dart';

class AppEndpoint {
  static String base = Env.baseApiUrl;

  static String url = "$base/api";
  
  //==================== Artist ====================//
  static String artist = '$url/artists';

  static String getTopArtistByCityAndRegion({required String city, required String region}) => '$artist/top/$city/$region';


  //==================== Region ====================//
  static String region = '$url/artists';

}