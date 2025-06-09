import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sky_lovers/modules/favorites/bindings/favorites_binding.dart';
import 'package:sky_lovers/modules/favorites/controllers/favorites_controller.dart';
import 'package:sky_lovers/ui/widgets/sunset_sunrise_background.dart';

class FavoritesView extends GetView<FavoritesController> {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SunsetSunriseBackground(
      child: Obx(() {
        if (controller.favorites.isEmpty) {
          return const Center(child: Text('No hay favoritos guardados.'));
        } else {
          return ListView.builder(
            itemCount: controller.favorites.length,
            itemBuilder: (context, index) {
              final favorite = controller.favorites[index];
              return ListTile(
                leading: Icon(favorite.type == 'sunrise' ? Icons.wb_sunny : Icons.nights_stay),
                title: Text(favorite.type == 'sunrise' ? 'Amanecer' : 'Atardecer'),
                subtitle: Text('Hora: ${favorite.time}\nFecha: ${favorite.date.toLocal().toIso8601String().split('T').first}'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    controller.removeFavorite(favorite);
                  },
                ),
              );
            },
          );
        }
      }),
    ));
  }
}
