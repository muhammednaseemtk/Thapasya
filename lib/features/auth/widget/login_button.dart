import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String txt;
  const LoginButton({super.key, required this.onPressed, required this.txt});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 270,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.darkRed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(txt, style: AppFonts.poppinsSemiBold8),
      ),
    );
  }
}
