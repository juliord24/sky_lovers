// To parse this JSON data, do
//
//     final temperatures = temperaturesFromJson(jsonString);

import 'dart:convert';

SunsetSunriseModel temperaturesFromJson(String str) =>
    SunsetSunriseModel.fromJson(json.decode(str));

String temperaturesToJson(SunsetSunriseModel data) =>
    json.encode(data.toJson());

class SunsetSunriseModel {
  int queryCost;
  double latitude;
  double longitude;
  String resolvedAddress;
  String address;
  String timezone;
  num tzoffset;
  String description;
  List<Day> days;

  SunsetSunriseModel({
    required this.queryCost,
    required this.latitude,
    required this.longitude,
    required this.resolvedAddress,
    required this.address,
    required this.timezone,
    required this.tzoffset,
    required this.description,
    required this.days,
  });

  factory SunsetSunriseModel.fromJson(Map<String, dynamic> json) =>
      SunsetSunriseModel(
        queryCost: json["queryCost"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        resolvedAddress: json["resolvedAddress"],
        address: json["address"],
        timezone: json["timezone"],
        tzoffset: json["tzoffset"],
        description: json["description"],
        days: List<Day>.from(json["days"].map((x) => Day.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "queryCost": queryCost,
        "latitude": latitude,
        "longitude": longitude,
        "resolvedAddress": resolvedAddress,
        "address": address,
        "timezone": timezone,
        "tzoffset": tzoffset,
        "description": description,
        "days": List<dynamic>.from(days.map((x) => x.toJson())),
      };
}

class Day {
  DateTime datetime;
  int datetimeEpoch;
  double tempmax;
  double tempmin;
  double temp;
  double feelslikemax;
  double feelslikemin;
  double feelslike;
  double dew;
  double humidity;
  double precip;
  double precipprob;
  double precipcover;
  num snow;
  num snowdepth;
  double windgust;
  double windspeed;
  double winddir;
  double pressure;
  double cloudcover;
  double visibility;
  double solarradiation;
  double solarenergy;
  num uvindex;
  num severerisk;
  String sunrise;
  num sunriseEpoch;
  String sunset;
  num sunsetEpoch;
  double moonphase;
  Conditions conditions;
  String description;
  Icon icon;
  Source source;
  List<Hour> hours;
  List<Icon>? preciptype;

  Day({
    required this.datetime,
    required this.datetimeEpoch,
    required this.tempmax,
    required this.tempmin,
    required this.temp,
    required this.feelslikemax,
    required this.feelslikemin,
    required this.feelslike,
    required this.dew,
    required this.humidity,
    required this.precip,
    required this.precipprob,
    required this.precipcover,
    required this.snow,
    required this.snowdepth,
    required this.windgust,
    required this.windspeed,
    required this.winddir,
    required this.pressure,
    required this.cloudcover,
    required this.visibility,
    required this.solarradiation,
    required this.solarenergy,
    required this.uvindex,
    required this.severerisk,
    required this.sunrise,
    required this.sunriseEpoch,
    required this.sunset,
    required this.sunsetEpoch,
    required this.moonphase,
    required this.conditions,
    required this.description,
    required this.icon,
    required this.source,
    required this.hours,
    this.preciptype,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        datetime: DateTime.parse(json["datetime"]),
        datetimeEpoch: json["datetimeEpoch"],
        tempmax: json["tempmax"]?.toDouble(),
        tempmin: json["tempmin"]?.toDouble(),
        temp: json["temp"]?.toDouble(),
        feelslikemax: json["feelslikemax"]?.toDouble(),
        feelslikemin: json["feelslikemin"]?.toDouble(),
        feelslike: json["feelslike"]?.toDouble(),
        dew: json["dew"]?.toDouble(),
        humidity: json["humidity"]?.toDouble(),
        precip: json["precip"]?.toDouble(),
        precipprob: json["precipprob"]?.toDouble(),
        precipcover: json["precipcover"]?.toDouble(),
        snow: json["snow"],
        snowdepth: json["snowdepth"],
        windgust: json["windgust"]?.toDouble(),
        windspeed: json["windspeed"]?.toDouble(),
        winddir: json["winddir"]?.toDouble(),
        pressure: json["pressure"]?.toDouble(),
        cloudcover: json["cloudcover"]?.toDouble(),
        visibility: json["visibility"]?.toDouble(),
        solarradiation: json["solarradiation"]?.toDouble(),
        solarenergy: json["solarenergy"]?.toDouble(),
        uvindex: json["uvindex"],
        severerisk: json["severerisk"],
        sunrise: json["sunrise"],
        sunriseEpoch: json["sunriseEpoch"],
        sunset: json["sunset"],
        sunsetEpoch: json["sunsetEpoch"],
        moonphase: json["moonphase"]?.toDouble(),
        conditions:
            conditionsValues.map[json["conditions"]] ?? Conditions.empty,
        description: json["description"],
        icon: iconValues.map[json["icon"]] ?? Icon.empty,
        source: sourceValues.map[json["source"]] ?? Source.fcst,
        hours: List<Hour>.from(json["hours"].map((x) => Hour.fromJson(x))),
        preciptype: json["preciptype"] == null
            ? []
            : List<Icon>.from(json["preciptype"]!
                .map((x) => iconValues.map[x] ?? Icon.empty)),
      );

  Map<String, dynamic> toJson() => {
        "datetime":
            "${datetime.year.toString().padLeft(4, '0')}-${datetime.month.toString().padLeft(2, '0')}-${datetime.day.toString().padLeft(2, '0')}",
        "datetimeEpoch": datetimeEpoch,
        "tempmax": tempmax,
        "tempmin": tempmin,
        "temp": temp,
        "feelslikemax": feelslikemax,
        "feelslikemin": feelslikemin,
        "feelslike": feelslike,
        "dew": dew,
        "humidity": humidity,
        "precip": precip,
        "precipprob": precipprob,
        "precipcover": precipcover,
        "snow": snow,
        "snowdepth": snowdepth,
        "windgust": windgust,
        "windspeed": windspeed,
        "winddir": winddir,
        "pressure": pressure,
        "cloudcover": cloudcover,
        "visibility": visibility,
        "solarradiation": solarradiation,
        "solarenergy": solarenergy,
        "uvindex": uvindex,
        "severerisk": severerisk,
        "sunrise": sunrise,
        "sunriseEpoch": sunriseEpoch,
        "sunset": sunset,
        "sunsetEpoch": sunsetEpoch,
        "moonphase": moonphase,
        "conditions": conditionsValues.reverse[conditions],
        "description": description,
        "icon": iconValues.reverse[icon],
        "source": sourceValues.reverse[source],
        "hours": List<dynamic>.from(hours.map((x) => x.toJson())),
        "preciptype": preciptype == null
            ? []
            : List<dynamic>.from(preciptype!.map((x) => iconValues.reverse[x])),
      };
}

enum Conditions {
  clear,
  empty,
  overcast,
  partiallyCloudy,
  rain,
  rainOvercast,
  rainPartiallyCloudy
}

final conditionsValues = EnumValues({
  "Clear": Conditions.clear,
  "": Conditions.empty,
  "Overcast": Conditions.overcast,
  "Partially cloudy": Conditions.partiallyCloudy,
  "Rain": Conditions.rain,
  "Rain, Overcast": Conditions.rainOvercast,
  "Rain, Partially cloudy": Conditions.rainPartiallyCloudy
});

class Hour {
  String datetime;
  int datetimeEpoch;
  Conditions conditions;
  Icon icon;
  double? temp;
  double? feelslike;
  double? humidity;
  double? dew;
  double? precip;
  double? precipprob;
  num? snow;
  num? snowdepth;
  double? windgust;
  double? windspeed;
  double? winddir;
  double? pressure;
  double? visibility;
  double? cloudcover;
  double? solarradiation;
  double? solarenergy;
  num? uvindex;
  num? severerisk;
  Source? source;
  List<Icon>? preciptype;

  Hour({
    required this.datetime,
    required this.datetimeEpoch,
    required this.conditions,
    required this.icon,
    this.temp,
    this.feelslike,
    this.humidity,
    this.dew,
    this.precip,
    this.precipprob,
    this.snow,
    this.snowdepth,
    this.windgust,
    this.windspeed,
    this.winddir,
    this.pressure,
    this.visibility,
    this.cloudcover,
    this.solarradiation,
    this.solarenergy,
    this.uvindex,
    this.severerisk,
    this.source,
    this.preciptype,
  });

  factory Hour.fromJson(Map<String, dynamic> json) => Hour(
        datetime: json["datetime"],
        datetimeEpoch: json["datetimeEpoch"],
        conditions: conditionsValues.map[json["conditions"]]!,
        icon: iconValues.map[json["icon"]] ?? Icon.empty,
        temp: json["temp"]?.toDouble(),
        feelslike: json["feelslike"]?.toDouble(),
        humidity: json["humidity"]?.toDouble(),
        dew: json["dew"]?.toDouble(),
        precip: json["precip"]?.toDouble(),
        precipprob: json["precipprob"]?.toDouble(),
        snow: json["snow"],
        snowdepth: json["snowdepth"],
        windgust: json["windgust"]?.toDouble(),
        windspeed: json["windspeed"]?.toDouble(),
        winddir: json["winddir"]?.toDouble(),
        pressure: json["pressure"]?.toDouble(),
        visibility: json["visibility"]?.toDouble(),
        cloudcover: json["cloudcover"]?.toDouble(),
        solarradiation: json["solarradiation"]?.toDouble(),
        solarenergy: json["solarenergy"]?.toDouble(),
        uvindex: json["uvindex"],
        severerisk: json["severerisk"],
        source: sourceValues.map[json["source"]] ?? Source.fcst,
        preciptype: json["preciptype"] == null
            ? []
            : List<Icon>.from(json["preciptype"]!
                .map((x) => iconValues.map[x] ?? Icon.empty)),
      );

  Map<String, dynamic> toJson() => {
        "datetime": datetime,
        "datetimeEpoch": datetimeEpoch,
        "conditions": conditionsValues.reverse[conditions],
        "icon": iconValues.reverse[icon],
        "temp": temp,
        "feelslike": feelslike,
        "humidity": humidity,
        "dew": dew,
        "precip": precip,
        "precipprob": precipprob,
        "snow": snow,
        "snowdepth": snowdepth,
        "windgust": windgust,
        "windspeed": windspeed,
        "winddir": winddir,
        "pressure": pressure,
        "visibility": visibility,
        "cloudcover": cloudcover,
        "solarradiation": solarradiation,
        "solarenergy": solarenergy,
        "uvindex": uvindex,
        "severerisk": severerisk,
        "source": sourceValues.reverse[source],
        "preciptype": preciptype == null
            ? []
            : List<dynamic>.from(preciptype!.map((x) => iconValues.reverse[x])),
      };
}

enum Icon {
  clearDay,
  clearNight,
  cloudy,
  empty,
  fog,
  partlyCloudyDay,
  partlyCloudyNight,
  rain
}

final iconValues = EnumValues({
  "clear-day": Icon.clearDay,
  "clear-night": Icon.clearNight,
  "cloudy": Icon.cloudy,
  "": Icon.empty,
  "fog": Icon.fog,
  "partly-cloudy-day": Icon.partlyCloudyDay,
  "partly-cloudy-night": Icon.partlyCloudyNight,
  "rain": Icon.rain
});

enum Source { fcst }

final sourceValues = EnumValues({"fcst": Source.fcst});

class EnumValues<T> {
  Map<String, T> map; // he inicializado el mapa
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
