import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thapasya/core/constants/app_fonts.dart';

class AttendanceHeader extends StatelessWidget {
  const AttendanceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final today = DateFormat("MMMM d, yyyy").format(DateTime.now());

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Text("Mark Attendance", style: AppFonts.poppinsSemiBold5),

        Text(today, style: AppFonts.poppinsBold2),
      ],
    );
  }
}
