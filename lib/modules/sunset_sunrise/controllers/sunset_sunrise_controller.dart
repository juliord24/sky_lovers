import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/models/sunset_sunrise_model.dart';
import '../../../data/providers/sunset_sunrise_provider.dart';

class SunsetSunriseController extends GetxController {
  late final SunsetSunriseModel sunsetSunriseModel;

  final RxString sunsetHour = ''.obs;
  final RxString sunriseHour = ''.obs;
  final RxString sunriseCloudCover = ''.obs;
  final RxString sunsetCloudCover = ''.obs;
  final RxString sunsetHumidity = ''.obs;
  final RxString sunriseHumidity = ''.obs;
  final RxString sunrisePrecipProb = ''.obs;
  final RxString sunsetPrecipProb = ''.obs;
  final RxString sunrisePrecipType = ''.obs;
  final RxString sunsetPrecipType = ''.obs;

  final RxString shownSunriseCloudCover = ''.obs;
  final RxString shownSunsetCloudCover = ''.obs;
  final RxString shownSunriseHumidity = ''.obs;
  final RxString shownSunsetHumidity = ''.obs;
  final RxString shownSunrisePrecipProb = ''.obs;
  final RxString shownSunsetPrecipProb = ''.obs;
  final RxString shownSunrisePrecipType = ''.obs;
  final RxString shownSunsetPrecipType = ''.obs;

  final RxString sunsetConclusion = ''.obs;
  final RxString sunriseConclusion = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    sunsetSunriseModel = await fetchWeatherData();
    await loadSunsetSunriseData();
    showData();
  }

  Future<void> loadSunsetSunriseData() async {
    sunsetHour.value = getSunsetHour();
    sunriseHour.value = getSunriseHour();
    sunriseCloudCover.value = getSunriseCloudCover();
    sunsetCloudCover.value = getSunsetCloudCover();
    sunriseHumidity.value = getSunriseHumidity();
    sunsetHumidity.value = getSunsetHumidity();
    sunrisePrecipProb.value = getSunrisePrecipProb();
    sunsetPrecipProb.value = getSunsetPrecipProb();
    sunrisePrecipType.value = getSunrisePrecipType();
    sunsetPrecipType.value = getSunsetPrecipType();
    update();
  }

  void showData() {
    shownSunriseCloudCover.value = showSunriseCloudCover();
    shownSunriseHumidity.value = showSunriseHumidity();
    shownSunsetCloudCover.value = showSunsetCloudCover();
    shownSunsetHumidity.value = showSunsetHumidity();
    sunsetConclusion.value =
        analyzeConditions(showSunsetCloudCover(), showSunsetHumidity());
    sunriseConclusion.value =
        analyzeConditions(showSunriseCloudCover(), showSunriseHumidity());
  }

  String getSunsetHour() {
    for (var day in sunsetSunriseModel.days) {
      if (day.datetime.day == DateTime.now().day) {
        return formatTime(day.sunset);
      }
    }
    return '';
  }

  String getSunriseHour() {
    for (var day in sunsetSunriseModel.days) {
      if (day.datetime.day == DateTime.now().day) {
        return formatTime(day.sunrise);
      }
    }
    return '';
  }

  //Formatea la hora
  String formatTime(String time) {
    DateFormat inputFormat = DateFormat('HH:mm:ss');
    DateFormat outputFormat = DateFormat('HH:mm');

    DateTime dateTime = inputFormat.parse(time);
    return outputFormat.format(dateTime);
  }

  String getSunriseCloudCover() {
    for (var dia in sunsetSunriseModel.days) {
      if (dia.datetime.day == DateTime.now().day) {
        for (var hora in dia.hours) {
          DateTime horaAmanecer = DateTime.parse('00000000 ${dia.sunrise}');
          DateTime horaDia = DateTime.parse('00000000 ${hora.datetime}');
          if (horaDia.hour == horaAmanecer.hour) {
            return hora.cloudcover.toString();
          }
        }
      }
    }
    return 'Error';
  }

  String getSunsetCloudCover() {
    for (var dia in sunsetSunriseModel.days) {
      if (dia.datetime.day == DateTime.now().day) {
        for (var hora in dia.hours) {
          DateTime horaAtardecer = DateTime.parse('00000000 ${dia.sunset}');
          DateTime horaDia = DateTime.parse('00000000 ${hora.datetime}');
          if (horaDia.hour == horaAtardecer.hour) {
            return hora.cloudcover.toString();
          }
        }
      }
    }
    return '';
  }

  String getSunriseHumidity() {
    for (var dia in sunsetSunriseModel.days) {
      if (dia.datetime.day == DateTime.now().day) {
        for (var hora in dia.hours) {
          DateTime horaAmanecer = DateTime.parse('00000000 ${dia.sunrise}');
          DateTime horaDia = DateTime.parse('00000000 ${hora.datetime}');
          if (horaDia.hour == horaAmanecer.hour) {
            return hora.humidity.toString();
          }
        }
      }
    }
    return '';
  }

  String getSunsetHumidity() {
    for (var dia in sunsetSunriseModel.days) {
      if (dia.datetime.day == DateTime.now().day) {
        for (var hora in dia.hours) {
          DateTime horaAtardecer = DateTime.parse('00000000 ${dia.sunset}');
          DateTime horaDia = DateTime.parse('00000000 ${hora.datetime}');
          if (horaDia.hour == horaAtardecer.hour) {
            return hora.humidity.toString();
          }
        }
      }
    }
    return '';
  }

  String getSunrisePrecipProb() {
    for (var dia in sunsetSunriseModel.days) {
      if (dia.datetime.day == DateTime.now().day) {
        for (var hora in dia.hours) {
          DateTime horaAmanecer = DateTime.parse('00000000 ${dia.sunrise}');
          DateTime horaDia = DateTime.parse('00000000 ${hora.datetime}');
          if (horaDia.hour == horaAmanecer.hour) {
            return hora.precipprob.toString();
          }
        }
      }
    }
    return '';
  }

  String getSunsetPrecipProb() {
    for (var dia in sunsetSunriseModel.days) {
      if (dia.datetime.day == DateTime.now().day) {
        for (var hora in dia.hours) {
          DateTime horaAtardecer = DateTime.parse('00000000 ${dia.sunset}');
          DateTime horaDia = DateTime.parse('00000000 ${hora.datetime}');
          if (horaDia.hour == horaAtardecer.hour) {
            return hora.precipprob.toString();
          }
        }
      }
    }
    return '';
  }

  String getSunrisePrecipType() {
    for (var dia in sunsetSunriseModel.days) {
      if (dia.datetime.day == DateTime.now().day) {
        for (var hora in dia.hours) {
          DateTime horaAmanecer = DateTime.parse('00000000 ${dia.sunrise}');
          DateTime horaDia = DateTime.parse('00000000 ${hora.datetime}');
          if (horaDia.hour == horaAmanecer.hour) {
            return hora.preciptype.toString();
          }
        }
      }
    }
    return '';
  }

  String getSunsetPrecipType() {
    for (var dia in sunsetSunriseModel.days) {
      if (dia.datetime.day == DateTime.now().day) {
        for (var hora in dia.hours) {
          DateTime horaAtardecer = DateTime.parse('00000000 ${dia.sunset}');
          DateTime horaDia = DateTime.parse('00000000 ${hora.datetime}');
          if (horaDia.hour == horaAtardecer.hour) {
            return hora.preciptype.toString();
          }
        }
      }
    }
    return '';
  }

  String showSunriseCloudCover() {
    num cloudCover = num.parse(sunriseCloudCover.value);
    if (cloudCover <= 25) {
      return "Despejado";
    } else if (cloudCover > 25 && cloudCover <= 50) {
      return "Algunas";
    } else if (cloudCover > 50 && cloudCover <= 75) {
      return "Nublado";
    } else {
      return "Cubierto";
    }
  }

  String showSunsetCloudCover() {
    num cloudCover = num.parse(sunsetCloudCover.value);
    if (cloudCover <= 25) {
      return "Despejado";
    } else if (cloudCover > 25 && cloudCover <= 50) {
      return "Algunas";
    } else if (cloudCover > 50 && cloudCover <= 75) {
      return "Nublado";
    } else {
      return "Cubierto";
    }
  }

  String showSunriseHumidity() {
    num humidity = num.parse(sunriseHumidity.value);
    if (humidity <= 25) {
      return "Baja";
    } else if (humidity > 25 && humidity <= 50) {
      return "Moderada";
    } else if (humidity > 50 && humidity <= 75) {
      return "Alta";
    } else {
      return "Muy alta";
    }
  }

  String showSunsetHumidity() {
    num humidity = num.parse(sunsetHumidity.value);
    if (humidity <= 25) {
      return "Baja";
    } else if (humidity > 25 && humidity <= 50) {
      return "Moderada";
    } else if (humidity > 50 && humidity <= 75) {
      return "Alta";
    } else {
      return "Muy alta";
    }
  }

  String analyzeConditions(String cloudCover, String humidity) {
    String analysis = "";

    // Combinaciones para Despejado
    if (cloudCover == "Despejado") {
      if (humidity == "Baja") {
        analysis =
            "tendrá tonos intensamente dorados y rojizos, creando un espectáculo vibrante.";
      } else if (humidity == "Moderada") {
        analysis = "ofrecerá colores cálidos con un toque suave y acogedor.";
      } else if (humidity == "Alta") {
        analysis =
            "presentará tonos más suaves y difuminados, con un ambiente sereno.";
      } else {
        // Muy alta
        analysis =
            "se verá con tonos pálidos y delicados, ofreciendo una vista tranquila.";
      }
    }

    // Combinaciones para Algunas nubes
    else if (cloudCover == "Algunas") {
      if (humidity == "Baja") {
        analysis =
            "creará un juego dinámico de luces y sombras, resaltando los tonos anaranjados y rosados.";
      } else if (humidity == "Moderada") {
        analysis =
            "se verá con un contraste de colores suaves y nítidos, ofreciendo un paisaje encantador.";
      } else if (humidity == "Alta") {
        analysis =
            "mostrará una paleta de colores suaves y armoniosos, creando un ambiente calmado.";
      } else {
        // Muy alta
        analysis =
            "tendrá un aspecto difuminado, con colores delicados y un toque melancólico.";
      }
    }

    // Combinaciones para Nublado
    else if (cloudCover == "Nublado") {
      if (humidity == "Baja") {
        analysis =
            "proyectará tonos sutiles, con breves momentos de luz que se filtran a través de las nubes.";
      } else if (humidity == "Moderada") {
        analysis =
            "mostrará colores suaves y dispersos, con una luz tenue y envolvente.";
      } else if (humidity == "Alta") {
        analysis = "se verá con una gama de grises y azules.";
      } else {
        // Muy alta
        analysis =
            "tendrá tonos muy suaves y homogéneos, con un aspecto más sombrío.";
      }
    }

    // Combinaciones para Cubierto
    else {
      // Cubierto
      if (humidity == "Baja") {
        analysis =
            "tendrá breves destellos de colores cálidos entre las nubes, ofreciendo un respiro visual.";
      } else if (humidity == "Moderada") {
        analysis =
            "se verá con colores apagados, pero con posibles momentos de luz suave.";
      } else if (humidity == "Alta") {
        analysis =
            "presentará un aspecto uniformemente gris, con muy poca variación de color.";
      } else {
        // Muy alta
        analysis =
            "tendrá un aspecto monocromático y muy homogéneo, sin apenas variaciones de color.";
      }
    }

    return analysis;
  }
}
