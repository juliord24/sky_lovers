import 'package:get/get.dart';

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
      binding: LoginBinding(),
    ),
  ];
}
