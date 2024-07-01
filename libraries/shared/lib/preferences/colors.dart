import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primaryColor = Color(0xFF035C99);

  static const MaterialColor primary = MaterialColor(
    0xFF0D9ABD,
    <int, Color>{
      100: Color(0xFFCFEBF2),
      200: Color(0xFFAEDDE9),
      300: Color(0xFF86CCDE),
      400: Color(0xFF5EBCD3),
      500: Color(0xFF35ABC8),
      600: Color(0xFF0D9ABD),
      700: Color(0xFF0B809D),
      800: Color(0xFF09677E),
      900: Color(0xFF064D5E),
    },
  );

  final color = AppColors.primary[25];
}
