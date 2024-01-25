import 'package:firebase_auth/firebase_auth.dart';

import '../services/auth_service.dart';

final authService = AuthService();

class AuthController {
  ///Llama al método [signInWithGoogle] de la clase [AuthService] y controla la lógica de inicio de sesión
  Future<User?> loginWithGoogle() async {
    User? user = await authService.signInWithGoogle();
    if (user != null) {
      // El usuario ha iniciado sesión correctamente, navegar a la pantalla principal
      print('Inicio de sesión exitoso: ${user.displayName}');
    } else {
      // Error en el inicio de sesión
      print('Error en el inicio de sesión');
    }
    return null;
  }

  ///Llama al método [signOut] de la clase [AuthService] y controla la lógica de cierre de sesión
  signOut() async {
    await authService.signOut();
  }
}
