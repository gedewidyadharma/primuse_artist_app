
import 'package:artist_app/routes/app_routes.dart';
import 'package:get/get.dart';

import '../modules/modules.dart';

class AppPages {
  static const initial = AppRoutes.splash;
  static final routes = [
     GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
     GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
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