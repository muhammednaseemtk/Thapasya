import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/attendance_controller.dart';

class AttendanceSummary extends StatelessWidget {
  const AttendanceSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AttendanceController>(
      builder: (context, controller, _) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFFEDEDED),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            "${controller.presentCount} present, "
            "${controller.absentCount} absent, "
            "${controller.lateCount} late",
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF4B5563),
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      },
    );
  }
}
