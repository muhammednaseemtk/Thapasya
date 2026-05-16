import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';

class AttendanceResultDialog extends StatelessWidget {
  final String result;

  const AttendanceResultDialog({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

      content: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          Icon(
            result == "success" ? Icons.check_circle : Icons.error,
            color: result == "success" ? Colors.green : Colors.red,
            size: 60,
          ),

          const SizedBox(height: 12),

          Text(
            result == "success" ? "Attendance Submitted Successfully" : result,

            textAlign: TextAlign.center,
            style: const TextStyle(color: AppColors.deepBlue),
          ),
        ],
      ),

      actions: [
        Center(
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },

            child: const Text(
              "OK",
              style: TextStyle(color: AppColors.deepBlue),
            ),
          ),
        ),
      ],
    );
  }
}
