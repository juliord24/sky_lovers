import 'package:get/get.dart';

import '../controllers/sunset_controller.dart';

class SunsetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SunsetController>(() => SunsetController());
  }
}