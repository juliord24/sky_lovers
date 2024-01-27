import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_lovers/modules/login/controllers/login_controller.dart';

///Página de inicio de sesión
class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Bienvenido a skyLovers'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: controller.signInWithGoogle,
              child: const Text('Iniciar sesión con Google'),
            ),
          ],
        ),
      ),
    );
  }
}
