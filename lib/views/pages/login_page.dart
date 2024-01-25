import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sky_lovers/controllers/auth_controller.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget{
  const LoginPage({super.key});

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
              child: const Text('Iniciar sesión con Google'),
              onPressed: () {

                try{
                  final user = AuthController().loginWithGoogle();
                  if(user != null){
                    print('Exito');
                    }
                } catch (e){
                  print('Error: $e');
                  }
            }
            )
          ],
        ),
      ),
    );
  }

}