import '../core.dart';

class AppEndpoint {
  static String base = Env.baseApiUrl;

  static String url = "$base/api";

  //==================== Artist ====================//
  static String artist = '$url/artists';

  static String getListArtist({required String keyword}) => '$artist/search?q=$keyword';

  static String getTopArtistByCityAndRegion({required String city, required String region, required String page}) => '$artist/top/$city/$region?page=$page&limit=10';

  //==================== Region ====================//
  static String region = '$url/regions';

  static String getFilterRegion = '$region/id';
  static String getFilterRegionById({required String  id, required String subRegionId}) => '$region/$id/$subRegionId';
}
