import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_lovers/ui/routes/pages.dart';
import 'package:sky_lovers/ui/theme/theme.dart';

import 'firebase_options.dart';

void main() async {
  // Comprueba que los bindings de los widgets estén inicializados
  WidgetsFlutterBinding.ensureInitialized();
  // Inicializa Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'skyLovers',
      theme: AppTheme.light,
      initialRoute:
          FirebaseAuth.instance.currentUser != null ? '/home' : '/login',
      getPages: Pages.pages,
    );
  }
}
