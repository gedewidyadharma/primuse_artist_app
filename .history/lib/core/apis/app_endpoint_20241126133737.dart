

class AppEndpoint {
  
  
  //==================== Artist ====================//
  static String artist = '$url/artist';

  static String getMoreArtists({required String page}) => '$artist/$page/30';
}