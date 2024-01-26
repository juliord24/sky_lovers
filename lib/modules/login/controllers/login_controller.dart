import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sky_lovers/modules/login/views/login_page.dart';

import '../../home/views/home_page.dart';


class LoginController extends GetxController{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();


  ///Inicia sesión con Google usando Firebase Auth y Google Sign In
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
      await _auth.signInWithCredential(credential);
      userCredential.user;
    } catch (e) {
      throw Exception(e);
    }
  }

  ///Cierra sesión con Google usando Firebase Auth y Google Sign In
  Future<void> signOut() async {
    await googleSignIn.signOut();
    await _auth.signOut();
  }
  ///Comprueba si el usuario está logueado o no
  ///Si está logueado, redirige a la página principal
  bool isUserLogged() {
    if (_auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }
}
