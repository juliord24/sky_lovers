import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/sunset_sunrise_controller.dart';

class SunriseView extends GetView<SunsetSunriseController> {
  const SunriseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Sunrise hour:"),
          Obx(() {
            // Verifica si sunsetHour es null
            if (controller.sunriseHour.value == "") {
              // Muestra un widget de carga
              return const CircularProgressIndicator();
            } else {
              return Text(controller.sunriseHour.value);
            }
          })
        ],
      )),
    );
  }
}
