import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sky_lovers/data/services/sunset_sunrise_service.dart';

class SunsetSunriseController extends GetxController {
  dynamic sunsetHour = ''.obs;
  dynamic sunriseHour = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadSunsetSunriseHour();
  }

  void loadSunsetSunriseHour() async {
    List<String> hora = await SunsetSunriseService().getSunsetSunriseHour();
    sunsetHour.value = hora[0];
    sunriseHour.value = hora[1];
    print("SUNSET: $sunsetHour");
    print("SUNRISE: $sunriseHour");
    update();
  }
}
