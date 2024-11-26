
import 'package:artist_app/routes/app_routes.dart';
import 'package:get/get.dart';

import '../modules/modules.dart';

class AppPages {
  static const initial = AppRoutes.main;
  static final routes = [
    GetPage(
      name: AppRoutes.main,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),
      GetPage(
      name: AppRoutes.artitsDetails,
      page: () => const ArtistDetailsPage(),
      binding: ArtistDetailsBinding(),
      transition: Transition.rightToLeftWithFade
    ),
  ];
}