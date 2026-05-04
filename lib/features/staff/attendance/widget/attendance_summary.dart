import 'package:flutter/material.dart';

class AttendanceSummary extends StatelessWidget {
  const AttendanceSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFEDEDED),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text(
        "2 present, 3 absent, 0 late",
        style: TextStyle(
          fontSize: 13,
          color: Color(0xFF4B5563),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}