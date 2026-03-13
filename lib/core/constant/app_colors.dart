import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Purple (role selector / splash)
  static const Color primaryPurple = Color(0xFF4A0080);
  static const Color accentPurple  = Color(0xFF7B2FBE);
  static const Color lightPurple   = Color(0xFFEDE0FF);

  // Green gradient (login card)
  static const Color greenTop    = Color(0xFFCDDC39);  // yellow-green
  static const Color greenBottom = Color(0xFF7CB342);  // medium green
  static const Color amber       = Color(0xFFFFA000);  // login button

  // Neutral
  static const Color white     = Color(0xFFFFFFFF);
  static const Color greyText  = Color(0xFF9E9E9E);
  static const Color darkText  = Color(0xFF1A1A2E);
  static const Color inputBg   = Color(0xFFFFFFFF);
  static const Color border    = Color(0xFFE0E0E0);
  static const Color black     = Color(0xFF000000);

  // Splash dark-red bg
  static const List<Color> bgGradient = [
    Color(0xFF080000),
    Color(0xFF3A0000),
    Color(0xFF6B0000),
    Color(0xFF3A0000),
    Color(0xFF080000),
  ];
  static const Color stripeLight = Color(0xFF9B0000);
  static const Color stripeDark  = Color(0xFF4A0000);
}