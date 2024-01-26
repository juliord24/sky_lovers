import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_lovers/modules/login/controllers/login_controller.dart';


///Página de inicio de sesión
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
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
                child: const Text('Iniciar sesión con Google'),
               onPressed: () async {
                  loginController.signInWithGoogle();
               },
            ),
            MaterialButton(
                child: const Text('Cerrar sesion'),
                onPressed: () {
                  loginController.signOut();
                })
          ],
        ),
      ),
    );
  }
}
