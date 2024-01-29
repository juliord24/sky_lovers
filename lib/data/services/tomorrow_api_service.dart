import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/tomorrow_api_model.dart';
import 'location_service.dart';

//Este es el ejemplo perfecto de como trabajar con apis, usamos el modelo de datos para devolver un tipo de dato con el que podemos trabajar y con este metodo hacemos la request
class TomorrowApiService{
  Future<Temperatures> fetchWeatherData() async {
    var latitude = await LocationService().getLatitude();
    var longitude = await LocationService().getLongitude();
    const String _apiKey = 'pB35ZYTtxignB2KofpOpBp2WdocZWSju';
    var url = Uri.parse('https://api.tomorrow.io/v4/weather/forecast?location=$latitude,$longitude&timesteps=1h&units=metric&apikey=$_apiKey');

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        return temperaturesFromJson(response.body);
      } else {
        print('Request failed with status: ${response.statusCode}.');
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      print('An error occurred: $e');
      throw Exception('Failed to load weather data');
    }
  }
}
