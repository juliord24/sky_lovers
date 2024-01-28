import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'location_service.dart';

class SunsetService{

  ///Obtiene la hora de la puesta de sol
  ///Utiliza el método [getLatitude] y [getLongitude] de la clase [LocationService] para obtener la latitud y longitud del dispositivo
  ///Utiliza la API de [https://sunrise-sunset.org/api] para obtener la hora de la puesta de sol
  ///Devuelve la hora de la puesta de sol en formato HH:mm usando los métodos [parseTime], [convertToLocalTime] y [formatTime]
  Future<String> getSunsetHour() async {
    var latitude = await LocationService().getLatitude();
    var longitude = await LocationService().getLongitude();
    var url = Uri.parse('https://api.sunrise-sunset.org/json?lat=$latitude&lng=$longitude&formatted=1');

    var sunsetHour = "";
    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        sunsetHour = data['results']['sunset'];
        print("SUNSET HOUR: $sunsetHour");
      } else {
        sunsetHour = 'No se ha podido obtener la hora de la puesta de sol';
      }

      sunsetHour = formatTime(convertToLocalTime(parseTime(sunsetHour)));
      return sunsetHour;
    } catch (e) {
      throw Exception(e);
    }
  }

  ///Obtiene la hora de la salida del sol
  ///Utiliza el método [getLatitude] y [getLongitude] de la clase [LocationService] para obtener la latitud y longitud del dispositivo
  ///Utiliza la API de [https://sunrise-sunset.org/api] para obtener la hora de la salida del sol
  ///Devuelve la hora de la salida del sol en formato HH:mm usando los métodos [parseTime], [convertToLocalTime] y [formatTime]
  Future<String> getSunriseHour() async {
    var latitude = await LocationService().getLatitude();
    var longitude = await LocationService().getLongitude();
    var url = Uri.parse('https://api.sunrise-sunset.org/json?lat=$latitude&lng=$longitude&formatted=1');

    var sunriseHour = "";
    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        sunriseHour = data['results']['sunrise'];
      } else {
        sunriseHour = 'No se ha podido obtener la hora de la salida del sol';
      }

      sunriseHour = formatTime(convertToLocalTime(parseTime(sunriseHour)));

      return sunriseHour;
    } catch (e) {
      throw Exception(e);
    }
  }

  DateTime parseTime(String timeStr) {
    // Convertir AM/PM a formato de 24 horas
    DateFormat format12h = DateFormat("h:mm:ss a");
    DateFormat format24h = DateFormat("HH:mm:ss");

    // Parsea la hora primero como 12 horas y luego formatea a 24 horas
    String formattedTimeStr = format24h.format(format12h.parse(timeStr));

    // Ahora añade la fecha genérica y 'Z' para UTC
    String dateTimeStr = "1970-01-01 " + formattedTimeStr + "Z";
    return DateTime.parse(dateTimeStr);
  }

  DateTime convertToLocalTime(DateTime utcTime) {
    return utcTime.toLocal();
  }

  String formatTime(DateTime dateTime) {
    DateFormat format = DateFormat("HH:mm");
    return format.format(dateTime);
  }






}