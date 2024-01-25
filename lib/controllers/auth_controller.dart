
import 'package:firebase_auth/firebase_auth.dart';

import '../services/auth_firebase.dart';
import 'package:get/get.dart';



class AuthController {

  /// Usa el método [signInWithGoogle] de la clase [AuthFirebase] para iniciar sesión con Google
  Future<User?> loginWithGoogle() async {
    return await AuthFirebase().signInWithGoogle();
  }
}