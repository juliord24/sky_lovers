
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '../services/auth_service.dart';
import 'package:get/get.dart';

import '../views/pages/login_page.dart';

final authService = AuthService();


class AuthController {
  /// Usa el método [signInWithGoogle] de la clase [AuthService] para iniciar sesión con Google
  Future<User?> loginWithGoogle() async {
    User? user = await authService.signInWithGoogle();
    if (user != null) {
      // El usuario ha iniciado sesión correctamente, navegar a la pantalla principal
      print('Inicio de sesión exitoso: ${user.displayName}');
    } else {
      // Error en el inicio de sesión
      print('Error en el inicio de sesión');
    }
  }

  signOut() async {
    await authService.signOut();
  }
}