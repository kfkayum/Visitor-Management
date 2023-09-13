import 'package:flutter/material.dart';

class AppColors {
  static const scaffoldColor = Color(0xFFE9EdF0);
  static const primaryColor = Color(0xFF029D91);
  static const lightGreyColor = Color.fromARGB(255, 148, 148, 148);
  static const deepGreyColor = Color.fromARGB(255, 99, 97, 97);
  static const redColor = Colors.red;
  static const whiteColor = Colors.white;
  static const blackColor = Colors.black;
  static const navButtonColor = Color.fromARGB(255, 108, 189, 111);
  static const navBGColor = Color.fromARGB(255, 223, 230, 223);

  static const int primarySwatchValue = 0xFF029D91;
  static const MaterialColor primarySwatchValueColor = MaterialColor(
    primarySwatchValue,
    <int, Color>{
      50: Color(primarySwatchValue),
      100: Color(primarySwatchValue),
      200: Color(primarySwatchValue),
      300: Color(primarySwatchValue),
      400: Color(primarySwatchValue),
      500: Color(primarySwatchValue),
      600: Color(primarySwatchValue),
      700: Color(primarySwatchValue),
      800: Color(primarySwatchValue),
      900: Color(primarySwatchValue),
    },
  );
}
