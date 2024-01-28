import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sky_lovers/data/services/sunset_service.dart';


class SunsetController extends GetxController {
  final dynamic sunriseHour = SunsetService().getSunriseHour();
  final dynamic sunsetHour = SunsetService().getSunsetHour();
}