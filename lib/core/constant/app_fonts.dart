import 'package:Thapasya/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static final TextStyle poppinsBold = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    color: AppColors.white
  );

  static const TextStyle poppinsSemiBold = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600
  );

  static const TextStyle poppinsSemiBold1 = TextStyle(
    fontFamily: 'Poppins',
    color: AppColors.white,
    fontSize: 30,
    fontWeight: FontWeight.w600
  );

  static const TextStyle poppinsSemiBold2 = TextStyle(
    fontFamily: 'Poppins',
    color: AppColors.white,
    fontSize: 16,
    fontWeight: FontWeight.w600
  );

  static const TextStyle poppinsRegular = TextStyle(
    color: AppColors.white,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: 18
  );
}