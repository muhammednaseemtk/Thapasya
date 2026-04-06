import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_fonts.dart';

class AttendanceHeader extends StatelessWidget {
  const AttendanceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  [
        Text(
          "Mark Attendance",
          style: AppFonts.poppinsSemiBold5
        ),

        Text(
          "March 17, 2026",
          style: AppFonts.poppinsBold2
        ),
      ],
    );
  }
}