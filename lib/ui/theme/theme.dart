import 'package:flutter/material.dart';

class AppTheme {
  // Tema claro
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.black,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.orangeAccent,
      ),
    );
  }

  // Tema oscuro (opcional)
  static ThemeData get dark {
    return ThemeData(
      primaryColor: Colors.grey[800],
      hintColor: Colors.blueGrey,
      scaffoldBackgroundColor: Colors.black,
      // Otros estilos globales...
    );
  }
}
