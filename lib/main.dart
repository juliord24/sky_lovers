import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sky_lovers/modules/home/views/home_page.dart';
import 'package:sky_lovers/modules/login/controllers/login_controller.dart';
import 'package:sky_lovers/modules/login/views/login_page.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

void main() async {
  // Comprueba que los bindings de los widgets estén inicializados
  WidgetsFlutterBinding.ensureInitialized();
  // Inicializa Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const MyApp()),
        GetPage(name: '/home', page: () => const HomePage()),
      ],
      title: 'skyLovers',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: loginController.returnPage(),
    );
  }
}
