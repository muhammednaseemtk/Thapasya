import 'package:Thapasya/core/constant/app_colors.dart';
import 'package:Thapasya/core/constant/app_fonts.dart';
import 'package:flutter/material.dart';


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
          backgroundColor: AppColors.brightRed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(14)
          )
        ),
        onPressed: onPressed,
        child: Text(txt,style: AppFonts.poppinsSemiBold2,),
        )
    );
  }
}