import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sky_lovers/modules/login/controllers/login_controller.dart';
import 'package:sky_lovers/ui/widgets/sunset_sunrise_background.dart';

///Página de inicio de sesión
class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Bienvenido a Sky Lovers'),
        ),
        body: SunsetSunriseBackground(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Gap(50),
                  Image.asset(
                    'assets/images/logo.png',
                    height:
                        200, // Ajusta el tamaño del logo según tus necesidades
                  ),
                  const Gap(200),
                  SignInButton(
                    Buttons.Google,
                    text: "Iniciar sesión con Google",
                    onPressed: controller.signInWithGoogle,
                  ),
                  const Gap(200)
                ],
              ),
            ),
          ),
        ));
  }
}
