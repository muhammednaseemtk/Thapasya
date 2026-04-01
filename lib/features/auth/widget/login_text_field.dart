import 'package:flutter/material.dart';
import 'package:thapasya/core/constant/app_colors.dart';
import 'package:thapasya/core/constant/app_fonts.dart';

class LoginTextField extends StatelessWidget {
  final String txt;
  final bool obsecureTxt;
  final TextEditingController controller;
  final IconData icon;
  const LoginTextField({
    super.key,
    required this.txt,
    required this.controller,
    required this.obsecureTxt,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: TextField(
        cursorColor: AppColors.brightRed,
        controller: controller,
        obscureText: obsecureTxt,
        style: AppFonts.poppinsSemiBold,
        decoration: InputDecoration(
          hintText: txt,
          hintStyle: TextStyle(color: AppColors.textField),
          prefixIcon: Icon(icon),
          prefixIconColor: AppColors.brightRed,
          filled: true,
          fillColor: AppColors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.brightRed),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.brightRed),
          ),
        ),
      ),
    );
  }
}
