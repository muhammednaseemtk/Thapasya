import 'package:Thapasya/core/constant/app_colors.dart';
import 'package:flutter/material.dart';


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
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: TextField(
        cursorColor: AppColors.darkRed,
        controller: controller,
        obscureText: obsecureTxt,
        style: TextStyle(color: AppColors.darkRed),
        decoration: InputDecoration(
          hintText: txt,
          hintStyle: TextStyle(color: AppColors.textField),
          prefixIcon: Icon(icon),
          prefixIconColor: AppColors.darkRed,
          filled: true,
          fillColor: AppColors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13)
          )
        ),
      ),
    );
  }
}