import 'package:Thapasya/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static final TextStyle appSubtitle = GoogleFonts.shareTech(
    color: AppColors.white,
    fontSize: 19
  );

  static final TextStyle login = GoogleFonts.inconsolata(
    color: AppColors.white,
    fontSize: 35,
    fontWeight: FontWeight.bold
  );

  static final TextStyle loginSubtitle = GoogleFonts.inconsolata(
    color: AppColors.white,
    fontSize: 20
  );

  static final TextStyle forget = GoogleFonts.inconsolata(
    color: AppColors.white,
    fontSize: 16
  );

  static final TextStyle loginButton = GoogleFonts.inconsolata(
    color: AppColors.white,
    fontSize: 18,
    fontWeight: FontWeight.w800
  );
}