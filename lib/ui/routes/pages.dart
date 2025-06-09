import 'package:get/get.dart';
import 'package:sky_lovers/modules/favorites/bindings/favorites_binding.dart';
import 'package:sky_lovers/modules/favorites/views/favorites_view.dart';
import 'package:sky_lovers/modules/home/bindings/home_binding.dart';
import 'package:sky_lovers/modules/settings/bindings/settings_binding.dart';
import 'package:sky_lovers/modules/settings/views/settings_view.dart';
import 'package:sky_lovers/modules/sunset_sunrise/views/sunset_view.dart';

import '../../modules/home/views/home_view.dart';
import '../../modules/login/bindings/login_binding.dart';
import '../../modules/login/views/login_view.dart';
import '../../modules/sunset_sunrise/bindings/sunset_sunrise_binding.dart';
import '../../modules/sunset_sunrise/views/sunrise_view.dart';

class Pages {
  static final pages = [
    GetPage(
      name: '/login',
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: '/home',
      page: () => const HomeView(),
      bindings: [
        HomeBinding(),
        LoginBinding(),
        SunsetSunriseBinding(),
        SettingsBinding(),
        FavoritesBinding(),
      ],
    ),
    GetPage(name: '/sunset', page: () => const SunsetView(), bindings: [
      SunsetSunriseBinding(),
      FavoritesBinding(),
    ]),
    GetPage(name: '/sunrise', page: () => const SunriseView(), bindings: [
      SunsetSunriseBinding(),
      FavoritesBinding(),
    ]),
    GetPage(
      name: '/settings',
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: '/favorites',
      page: () => const FavoritesView(),
      binding: FavoritesBinding(),
    )
  ];
}
