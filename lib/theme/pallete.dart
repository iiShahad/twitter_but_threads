import 'package:flutter/material.dart';

class Pallete {
  static const Color backgroundColor = Color(0xFF000000);
  static const Color surface = Color(0xFF202327);
  static const Color primary = Color(0xff7545f6);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color greyColor = Color(0xFF9E9E9E);
  static const Color redColor = Color(0xFFF9197F);

  static ThemeData theme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Pallete.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Pallete.backgroundColor,
      elevation: 0,
    ),
    useMaterial3: true,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
    ),
  );
}
