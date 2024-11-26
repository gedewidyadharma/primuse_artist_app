

import '../core.dart';

class AppEndpoint {
  static String base = Env.baseApiUrl;

  static String url = "$base/api";
  
  //==================== Artist ====================//
  static String artist = '$url/artist';

  static String getMoreArtists({required String page}) => '$artist/$page/30';
}