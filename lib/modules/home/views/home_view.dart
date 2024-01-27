import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_lovers/modules/home/controllers/home_controller.dart';
import 'package:sky_lovers/modules/sunset/views/sunset_view.dart';

///Página principal de la aplicación
class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Barra de navegación'),
      ),
      body: Obx(() {
        return IndexedStack(
          index: controller.currentIndex.value,
          children: const [
            SunsetView(),
            Center(
              child: Text('Ayuda'),
            ),
          ],
        );
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.cloud),
              label: 'Sunset',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.not_interested_rounded),
              label: 'Help',
            )
          ],
        );
      }),
    );
  }
}
