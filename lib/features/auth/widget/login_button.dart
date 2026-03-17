import 'package:Thapasya/core/constant/app_colors.dart';
import 'package:flutter/material.dart';


class CommonButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String txt;
  const CommonButton({super.key, required this.onPressed, required this.txt});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 270,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(14)
          )
        ),
        onPressed: onPressed,
        child: Text(txt),
      ),
    );
  }
}