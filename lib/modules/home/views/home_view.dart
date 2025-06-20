import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:sky_lovers/modules/favorites/views/favorites_view.dart';
import 'package:sky_lovers/modules/home/controllers/home_controller.dart';
import 'package:sky_lovers/modules/settings/views/settings_view.dart';
import 'package:sky_lovers/modules/sunset_sunrise/views/sunrise_view.dart';

import '../../sunset_sunrise/views/sunset_view.dart';

///Página principal de la aplicación
class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sky Lovers'),
      ),
      body: PageView(
        controller: controller.pageController,
        onPageChanged: (index) {
          controller.currentIndex.value = index;
        },
        children: const [
          SunriseView(),
          SunsetView(),
          FavoritesView(),
          SettingsView(),
        ],
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.sunrise, size: 20),
              label: 'Amanecer',
            ),
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.sunset, size: 20),
              label: 'Atardecer',
            ),
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.heart, size: 20),
              label: 'Favoritos',
            ),
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.settings, size: 20),
              label: 'Ajustes',
            ),
          ],
        );
      }),
    );
  }
}
