import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/sunset_sunrise_model.dart';
import '../services/location_service.dart';

Future<SunsetSunriseModel> fetchWeatherData() async {
  double lat = await LocationService().getLatitude();
  double lon = await LocationService().getLongitude();
  //print('lat: $lat, lon: $lon');
  const String key = '9QS38ACX9ZMZU6S96R2Y9NS9A';
  final String apiUrl =
      'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/$lat,$lon?unitGroup=metric&include=hours%2Cfcst%2Cobs%2Cremote&key=$key&options=nonulls&contentType=json';

  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    return SunsetSunriseModel.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load weather data');
  }
}
