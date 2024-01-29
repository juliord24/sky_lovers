import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sky_lovers/data/models/tomorrow_api_model.dart';
import 'dart:convert';

import 'package:sky_lovers/data/services/sunset_sunrise_service.dart';
import 'package:sky_lovers/data/services/tomorrow_api_service.dart';

class SunsetSunriseController extends GetxController {
  dynamic sunsetHour = ''.obs;
  dynamic sunriseHour = ''.obs;
  dynamic cloudCover = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadSunsetSunriseHour();
  }


  void loadSunsetSunriseHour() async {
    List<String> hora = await SunsetSunriseService().getSunsetSunriseHour();
    Temperatures temp = await TomorrowApiService().fetchWeatherData();
    sunsetHour.value = hora[0];
    sunriseHour.value = hora[1];
    update();
  }
}
