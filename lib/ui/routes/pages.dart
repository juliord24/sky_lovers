import 'package:get/get.dart';
import 'package:sky_lovers/modules/home/bindings/home_binding.dart';
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
      ],
    ),
    GetPage(
      name: '/sunset',
      page: () => const SunsetView(),
      binding: SunsetSunriseBinding(),
    ),
    GetPage(
      name: '/sunrise',
      page: () => const SunriseView(),
      binding: SunsetSunriseBinding(),
    ),
  ];
}
