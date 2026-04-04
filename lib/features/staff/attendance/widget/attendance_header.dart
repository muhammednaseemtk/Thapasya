import 'package:flutter/material.dart';

class AttendanceHeader extends StatelessWidget {
  const AttendanceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  [
        Text(
          "Mark Attendance",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2C2C2C),
          ),
        ),

        Text(
          "March 17, 2026",
          style: TextStyle(
            fontSize: 13,
            color: Color(0xFF6B7280),
          ),
        ),
      ],
    );
  }
}