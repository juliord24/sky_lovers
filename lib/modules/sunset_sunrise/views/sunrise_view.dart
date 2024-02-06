import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/sunset_sunrise_controller.dart';

class SunriseView extends GetView<SunsetSunriseController> {
  const SunriseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.blue,
            alignment: Alignment.center,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              const Gap(40),
              Obx(() {
                if (controller.sunriseHour.value == "") {
                  return const CircularProgressIndicator();
                } else {
                  return Text(
                    controller.sunriseHour.value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  );
                }
              }),
              const Gap(20),
              Obx(() {
                if (controller.shownSunriseCloudCover.value == "") {
                  return const CircularProgressIndicator();
                } else {
                  return Text(
                    controller.shownSunriseCloudCover.value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  );
                }
              }),
            ])));
  }
}
