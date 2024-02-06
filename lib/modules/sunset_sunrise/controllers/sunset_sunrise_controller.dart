import 'dart:math';

import 'package:get/get.dart';

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
  }

  String getSunsetHour() {
    for (var day in sunsetSunriseModel.days) {
      if (day.datetime.day == DateTime.now().day) {
        return day.sunset;
      }
    }
    return '';
  }

  String getSunriseHour() {
    for (var day in sunsetSunriseModel.days) {
      if (day.datetime.day == DateTime.now().day) {
        return day.sunrise;
      }
    }
    return '';
  }

  String getSunriseCloudCover() {
    for (var dia in sunsetSunriseModel.days) {
      print("El dia es ${dia.datetime.day} y hoy es ${DateTime.now().day}");
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
    Random random = Random();
    print("sunriseCloudCover: $sunriseCloudCover.value");
    num cloudCover = num.parse(sunriseCloudCover.value);
    final List<String> cloudCoverMessagesLow = [
      "El cielo está súper claro, ¡perfecto para un amanecer de postal!",
      "Solo unas pocas nubecillas. ¡Prepárate para un sol radiante!",
      "Casi nada de nubes hoy. El amanecer va a estar genial.",
      "Casi despejado: el sol brilla fuerte, ¡un amanecer sin filtros!",
      "Con tan pocas nubes, prepárate para un espectáculo de colores vivos.",
      "Pocas nubes a la vista, el amanecer se muestra en todo su esplendor.",
    ];
    final List<String> cloudCoverMessagesMedium = [
      "Un mix de nubes y claros, el amanecer se pone interesante.",
      "Nubes aquí y allá. ¿Listo para un amanecer con estilo?",
      "Mitad nubes, mitad cielo. El amanecer promete sorpresas.",
      "Esos algodones en el cielo van a darle un toque mágico al amanecer.",
      "Nubes medias, ¿sabes? Eso significa colores más intensos y dramáticos.",
      "El sol jugueteando con las nubes, nos espera un amanecer de película."
    ];
    final List<String> cloudCoverMessagesHigh = [
      "Con tantas nubes, el sol va a jugar al escondite.",
      "Un cielo bastante nublado, pero el sol no se rinde.",
      "Nubes por doquier, pero aún así, el amanecer tiene su encanto.",
      "Muchas nubes, pero eso solo hace que los rayos del sol sean más espectaculares.",
      "Con el cielo así de nublado, cada rayo de sol es un regalo visual.",
      "Un amanecer más misterioso hoy, con las nubes creando un efecto difuminado."
    ];
    final List<String> cloudCoverMessagesVeryHigh = [
      "El cielo está a tope de nubes, pero aún así, algo de luz se colará.",
      "Un manto nuboso nos cubre, pero no perdamos la esperanza.",
      "Hoy toca adivinar dónde está el sol, ¡un amanecer misterioso!",
      "Amanecer cubierto, pero esos pequeños momentos en que el sol asoma serán únicos.",
      "Un cielo lleno de nubes nos da un amanecer suave y difuso.",
      "Con tanta nube, cada destello del sol se siente como un guiño especial.",
    ];

    if (cloudCover <= 25) {
      return cloudCoverMessagesLow[
          random.nextInt(cloudCoverMessagesLow.length)];
    } else if (cloudCover > 25 && cloudCover <= 50) {
      return cloudCoverMessagesMedium[
          random.nextInt(cloudCoverMessagesMedium.length)];
    } else if (cloudCover > 50 && cloudCover <= 75) {
      return cloudCoverMessagesHigh[
          random.nextInt(cloudCoverMessagesHigh.length)];
    } else {
      return cloudCoverMessagesVeryHigh[
          random.nextInt(cloudCoverMessagesVeryHigh.length)];
    }
  }

  String showSunsetCloudCover() {
    Random random = Random();
    num cloudCover = num.parse(sunriseCloudCover.value);
    final List<String> cloudCoverMessagesLow = [
      "Cielo despejado, atardecer brillante en el horizonte.",
      "Pocas nubes, la luz del sol se filtra suavemente.",
      "Claro y hermoso, el alba se presenta clara."
    ];
    final List<String> cloudCoverMessagesMedium = [
      "Algunas nubes, un lienzo para un atardecer pintoresco.",
      "Nubes esparcidas, esperemos un atardecer colorido.",
      "Nubosidad parcial, un preludio a un atardecer vibrante."
    ];
    final List<String> cloudCoverMessagesHigh = [
      "Cielo nublado, atisbos de luz entre las nubes.",
      "Nubes densas, un atardecer suave y difuminado.",
      "El cielo cubierto, el sol trata de asomarse."
    ];
    final List<String> cloudCoverMessagesVeryHigh = [
      "Muy nublado, un amanecer tenue nos espera.",
      "Cubierta completa, la luz se oculta tras el manto nuboso.",
      "Un manto de nubes, esperando un claro para el sol."
    ];

    if (cloudCover <= 25) {
      return cloudCoverMessagesLow[
          random.nextInt(cloudCoverMessagesLow.length)];
    } else if (cloudCover > 25 && cloudCover <= 50) {
      return cloudCoverMessagesMedium[
          random.nextInt(cloudCoverMessagesMedium.length)];
    } else if (cloudCover > 50 && cloudCover <= 75) {
      return cloudCoverMessagesHigh[
          random.nextInt(cloudCoverMessagesHigh.length)];
    } else {
      return cloudCoverMessagesVeryHigh[
          random.nextInt(cloudCoverMessagesVeryHigh.length)];
    }
  }

  String showSunriseHumidity() {
    Random random = Random();
    num humidity = double.parse(sunriseHumidity.value);
    final List<String> humidityMessagesLow = [
      "Aire seco, el amanecer será claro y nítido.",
      "Poca humedad, visibilidad excelente para el sol naciente.",
      "Seco y fresco, disfruta la salida del sol."
    ];
    final List<String> humidityMessagesMedium = [
      "Moderada humedad, el amanecer podría traer un arcoiris.",
      "Equilibrio perfecto para un amanecer agradable.",
      "Humedad agradable, ideal para un paseo matutino."
    ];
    final List<String> humidityMessagesHigh = [
      "El aire húmedo difumina el horizonte del amanecer.",
      "Humedad presente, el amanecer se siente tropical.",
      "Sensación húmeda, el rocío acompaña al amanecer."
    ];
    final List<String> humidityMessagesVeryHigh = [
      "Muy húmedo, el amanecer trae consigo el orvallo.",
      "Alta humedad, el sol lucha a través de la bruma.",
      "El aire cargado preludia un amanecer húmedo y fresco."
    ];

    if (humidity <= 25) {
      return humidityMessagesLow[random.nextInt(humidityMessagesLow.length)];
    } else if (humidity > 25 && humidity <= 50) {
      return humidityMessagesMedium[
          random.nextInt(humidityMessagesMedium.length)];
    } else if (humidity > 50 && humidity <= 75) {
      return humidityMessagesHigh[random.nextInt(humidityMessagesHigh.length)];
    } else {
      return humidityMessagesVeryHigh[
          random.nextInt(humidityMessagesVeryHigh.length)];
    }
  }

  String showSunsetHumidity() {
    Random random = Random();
    num humidity = double.parse(sunriseHumidity.value);
    final List<String> humidityMessagesLow = [
      "Aire seco, el amanecer será claro y nítido.",
      "Poca humedad, visibilidad excelente para el sol naciente.",
      "Seco y fresco, disfruta la salida del sol."
    ];
    final List<String> humidityMessagesMedium = [
      "Moderada humedad, el amanecer podría traer un arcoiris.",
      "Equilibrio perfecto para un amanecer agradable.",
      "Humedad agradable, ideal para un paseo matutino."
    ];
    final List<String> humidityMessagesHigh = [
      "El aire húmedo difumina el horizonte del amanecer.",
      "Humedad presente, el amanecer se siente tropical.",
      "Sensación húmeda, el rocío acompaña al amanecer."
    ];
    final List<String> humidityMessagesVeryHigh = [
      "Muy húmedo, el amanecer trae consigo el orvallo.",
      "Alta humedad, el sol lucha a través de la bruma.",
      "El aire cargado preludia un amanecer húmedo y fresco."
    ];

    if (humidity <= 25) {
      return humidityMessagesLow[random.nextInt(humidityMessagesLow.length)];
    } else if (humidity > 25 && humidity <= 50) {
      return humidityMessagesMedium[
          random.nextInt(humidityMessagesMedium.length)];
    } else if (humidity > 50 && humidity <= 75) {
      return humidityMessagesHigh[random.nextInt(humidityMessagesHigh.length)];
    } else {
      return humidityMessagesVeryHigh[
          random.nextInt(humidityMessagesVeryHigh.length)];
    }
  }
}
