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
          })
        ],
      )),
    );
  }
}
