import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sky_lovers/ui/theme/theme.dart';

class SettingsController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void showLogoutDialog() {
    Get.defaultDialog(
      title: 'Cerrar Sesión',
      middleText: '¿Estás seguro de que quieres cerrar sesión?',
      textCancel: 'Cancelar',
      textConfirm: 'Cerrar Sesión',
      confirmTextColor: Colors.black,
      backgroundColor: Colors.white,
      buttonColor: Colors.lightBlueAccent,
      onConfirm: () {
        signOut();
        //Get.offNamed('login');
        Get.offAllNamed("login");
      },
    );
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
      Get.snackbar('Éxito', 'Has cerrado sesión');
    } catch (e) {
      Get.snackbar('Error', 'Error al cerrar sesión: $e');
    }
  }
}
