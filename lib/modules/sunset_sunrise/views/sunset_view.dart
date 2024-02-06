import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/sunset_sunrise_controller.dart';

class SunsetView extends GetView<SunsetSunriseController> {
  const SunsetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Sunset hour:"),
          Obx(() {
            // Verifica si sunsetHour es null
            if (controller.sunsetHour.value == "") {
              // Muestra un widget de carga
              return const CircularProgressIndicator();
            } else {
              return Text(controller.sunsetHour.value);
            }
          }),
          const Text("Cloud cover:"),
          Obx(() {
            // Verifica si cloudCover es null
            if (controller.sunsetCloudCover.value == "") {
              // Muestra un widget de carga
              return const CircularProgressIndicator();
            } else {
              return Text(controller.sunsetCloudCover.value);
            }
          }),
          const Text("Humidity:"),
          Obx(() {
            // Verifica si humidity es null
            if (controller.sunsetHumidity.value == "") {
              // Muestra un widget de carga
              return const CircularProgressIndicator();
            } else {
              return Text(controller.sunsetHumidity.value);
            }
          }),
          const Text("Precipitation probability:"),
          Obx(() {
            // Verifica si precipitation probability es null
            if (controller.sunsetPrecipProb.value == "") {
              // Muestra un widget de carga
              return const CircularProgressIndicator();
            } else {
              return Text(controller.sunsetPrecipProb.value);
            }
          }),
          const Text("Precipitation type:"),
          Obx(() {
            // Verifica si precipitation type es null
            if (controller.sunsetPrecipType.value == "") {
              // Muestra un widget de carga
              return const CircularProgressIndicator();
            } else {
              return Text(controller.sunsetPrecipType.value);
            }
          })
        ],
      )),
    );
  }
}
