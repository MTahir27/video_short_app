import 'package:flutter/material.dart';

class Pallete {
  // static const primaryColor = Color(0xFF0D2444);
  static const primaryColor = MaterialColor(
    0xFF12305B,
    <int, Color>{
      50: Color.fromRGBO(18, 48, 91, 0.5),
      100: Color.fromRGBO(18, 48, 91, 0.1),
      200: Color.fromRGBO(18, 48, 91, 0.2),
      300: Color.fromRGBO(18, 48, 91, 0.3),
      400: Color.fromRGBO(18, 48, 91, 0.4),
      500: Color.fromRGBO(18, 48, 91, 0.5),
      600: Color.fromRGBO(18, 48, 91, 0.6),
      700: Color.fromRGBO(18, 48, 91, 0.7),
      800: Color.fromRGBO(18, 48, 91, 0.8),
      900: Color.fromRGBO(18, 48, 91, 0.9),
    },
  );

  static const secondaryColor = Color(0xFF3CFEDE);
  static const tertiaryColor = Color(0xFF0D2444);
  static const grayColor = Color(0xFF424242);
  static const bottomBarIncativeColor = Color(0xFFA0ACBD);
  static const whiteColor = Color(0xFFFFFFFF);
  static const blackColor = Color(0xFF000000);
  static const primaryGradientColor = LinearGradient(
    colors: [Color(0xFF3CFEDE), Color(0xFF3263B0)],
    end: Alignment.centerLeft,
    begin: Alignment.centerRight,
  );
}
