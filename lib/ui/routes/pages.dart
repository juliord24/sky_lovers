import 'package:get/get.dart';
import 'package:sky_lovers/modules/home/bindings/home_binding.dart';
import 'package:sky_lovers/modules/sunset/views/sunset_view.dart';

import '../../modules/home/views/home_view.dart';
import '../../modules/login/bindings/login_binding.dart';
import '../../modules/login/views/login_view.dart';

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
      ],
    ),
    GetPage(
      name: '/sunset',
      page: () => const SunsetView(),
    ),
  ];
}
