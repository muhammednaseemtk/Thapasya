import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

      title: const Text(
        "Success",
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColors.deepBlue),
      ),

      content: const Text(
        "Daily Log Submitted Successfully",
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColors.deepBlue),
      ),

      actions: [
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.deepBlue,
            ),

            onPressed: () {
              Navigator.pop(context);
            },

            child: const Text("OK", style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
