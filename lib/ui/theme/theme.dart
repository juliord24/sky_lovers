import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final TextStyle hourTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 48,
    fontFamily: GoogleFonts.robotoSlab().fontFamily,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle staticTextStyle = TextStyle(
    color: Colors
        .blueGrey, // Gris azulado, más oscuro para destacar sobre el dinámico
    fontSize: 25, // Tamaño ligeramente más grande que el dinámico
    fontWeight: FontWeight.w500,
    fontFamily: GoogleFonts.nunito().fontFamily,
    //color: const Color(0xFF003366),
    //fontFamily: GoogleFonts.nunito().fontFamily,
    //fontSize: 30,
  );

  static final TextStyle dynamicTextStyle = TextStyle(
    color: Colors.white, // Gris azulado claro, menos prominente
    fontSize: 23, // Tamaño moderado para diferenciar de texto estático
    fontWeight: FontWeight.w300,
    fontFamily: GoogleFonts.nunito().fontFamily,
  );

  //un tipo de fuente para texto animado
  static final TextStyle animatedTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w500,
    fontFamily: GoogleFonts.robotoMono().fontFamily,
  );
  // Tema claro
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF89CFF0),
        foregroundColor: Colors.black,
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        //backgroundColor: Color(0xFFFFDAB9),
        backgroundColor: Color(0xFFE8C5A8),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
      ),
      textTheme: TextTheme(
        bodyMedium: staticTextStyle,
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Color(0xFF89CFF0),
        textTheme: ButtonTextTheme.primary,
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
