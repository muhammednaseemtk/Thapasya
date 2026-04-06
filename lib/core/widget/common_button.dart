import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? txt;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? icon;
  final double? width;
  final double? height;

  const CommonButton({
    super.key,
    required this.onPressed,
    this.txt,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 45,
      width: width ?? double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, color: textColor ?? AppColors.white, size: 20),
              const SizedBox(width: 8),
            ],
            Text(
              txt ?? "",
              style: AppFonts.poppinsSemiBold8.copyWith(
                color: textColor ?? AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}