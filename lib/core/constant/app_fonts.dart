import 'package:Thapasya/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static final TextStyle appSubtitle = GoogleFonts.shareTech(
    color: AppColors.white,
    fontSize: 19
  );

  static final TextStyle login = GoogleFonts.poppins(
    color: AppColors.white,
    fontSize: 30,
    fontWeight: FontWeight.w600
  );

  static final TextStyle loginSubtitle = GoogleFonts.poppins(
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

  static final TextStyle appName = GoogleFonts.inconsolata(
    color: AppColors.black,
    fontSize: 27,
    fontWeight: FontWeight.w900
  );
}