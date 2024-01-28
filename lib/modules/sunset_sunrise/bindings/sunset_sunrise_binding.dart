import 'package:get/get.dart';

import '../controllers/sunset_sunrise_controller.dart';

class SunsetSunriseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SunsetSunriseController>(() => SunsetSunriseController());
  }
}
