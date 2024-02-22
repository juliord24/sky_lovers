import 'package:flutter/material.dart';

class SunsetSunriseBackground extends StatelessWidget {
  final Widget child;

  const SunsetSunriseBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF89CFF0),
            Color(0xFFE8C5A8), // Azul claro
            //Color(0xFFFFDAB9), // Melocotón
          ],
        ),
      ),
      child: child,
    );
  }
}
