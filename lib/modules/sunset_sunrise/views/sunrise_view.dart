import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sky_lovers/modules/favorites/controllers/favorites_controller.dart';
import 'package:sky_lovers/ui/widgets/sunset_sunrise_background.dart';

import '../../../ui/theme/theme.dart';
import '../controllers/sunset_sunrise_controller.dart';

class SunriseView extends GetView<SunsetSunriseController> {
  const SunriseView({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoritesController favoritesController = Get.put(FavoritesController());
    SunriseSunset sunrise;
    final DateTime now = DateTime.now();
    return Scaffold(
      body: SunsetSunriseBackground(child: SingleChildScrollView(child: Obx(() {
        if (controller.sunriseHour.value == "") {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LoadingAnimationWidget.inkDrop(color: Colors.white, size: 80),
              const Gap(60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Gap(10),
                  Flexible(
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText("El sol está en camino...",
                            textStyle: AppTheme.animatedTextStyle,
                            textAlign: TextAlign.center,
                            speed: const Duration(milliseconds: 100)),
                      ],
                    ),
                  ),
                  const Gap(10),
                ],
              )
            ],
          );
        } else {
          sunrise = SunriseSunset(
            id: 'sunrise_${now.year}_${now.month}_${now.day}',
            type: 'sunrise',
            time: controller.sunriseHour.value, // Convertido a String
            date: now,
          );
          return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(30),
                Obx(() {
                  return Text(
                    controller.sunriseHour.value,
                    style: AppTheme.hourTextStyle,
                  );
                }),
                const Gap(50),
                const Text("Cielo:"),
                const Gap(5),
                Obx(() {
                  return Text(
                    controller.shownSunriseCloudCover.value,
                    style: AppTheme.dynamicTextStyle,
                  );
                }),
                const Gap(50),
                const Text("Humedad:"),
                const Gap(5),
                Obx(() {
                  return Text(
                    controller.shownSunriseHumidity.value,
                    style: AppTheme.dynamicTextStyle,
                  );
                }),
                const Gap(40),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 60,
                  color: AppTheme.dynamicTextStyle.color!,
                ),
                const Gap(30),
                const Text("El amanecer..."),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Gap(15),
                    Obx(() {
                      return Flexible(
                          child: Text(
                        controller.sunriseConclusion.value,
                        style: AppTheme.dynamicTextStyle,
                        textAlign: TextAlign.center,
                      ));
                    }),
                    const Gap(15),
                  ],
                ),
                const Gap(30),
                Obx(() {
                  final isFavorite = favoritesController.isFavorite(sunrise);
                  return IconButton(
                    icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
                    onPressed: () {
                      if (isFavorite) {
                        favoritesController.removeFavorite(sunrise);
                      } else {
                        favoritesController.addFavorite(sunrise);
                      }
                    },
                  );
                }),
              ]);
        }
      }))),
    );
  }
}
