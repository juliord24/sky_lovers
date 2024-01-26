
import 'package:flutter/material.dart';

///Página principal de la aplicación
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}