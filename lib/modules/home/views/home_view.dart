import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../login/controllers/login_controller.dart';

///Página principal de la aplicación
class HomeView extends GetView<LoginController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              child: const Text('Cerrar sesion'),
              onPressed: () {
                controller.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
