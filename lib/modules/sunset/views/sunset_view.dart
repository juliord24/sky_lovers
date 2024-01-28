import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_lovers/modules/sunset/controllers/sunset_controller.dart';

class SunsetView extends GetView<SunsetController> {
  const SunsetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("Sunset hour:"),
            FutureBuilder<String>(
              future: controller.sunsetHour,
              builder: (context, snapshot) {
                // Comprueba si los datos han llegado.
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    // Si el Future terminó con error.
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    // Cuando el Future se completa con éxito, muestra tus datos.
                    return Text(snapshot.data!); // Utiliza ! para asegurar que los datos no son nulos.
                  }
                }
                // Mientras se espera que el Future se complete, muestra un indicador de carga.
                return const CircularProgressIndicator();
              },
            ),
            const Text("Sunrise hour:"),
            FutureBuilder<String>(
              future: controller.sunriseHour,
              builder: (context, snapshot) {
                // Comprueba si los datos han llegado.
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    // Si el Future terminó con error.
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    // Cuando el Future se completa con éxito, muestra tus datos.
                    return Text(snapshot.data!); // Utiliza ! para asegurar que los datos no son nulos.
                  }
                }
                // Mientras se espera que el Future se complete, muestra un indicador de carga.
                return const CircularProgressIndicator();
              },
            )
          ],
        )
      ),
    );
  }
}
