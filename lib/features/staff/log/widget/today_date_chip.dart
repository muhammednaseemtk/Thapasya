import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thapasya/core/constants/app_colors.dart';

class TodayDateChip extends StatelessWidget {
  const TodayDateChip({super.key});

  @override
  Widget build(BuildContext context) {
    final today = DateFormat("MMMM d, yyyy").format(DateTime.now());

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFEDEDED),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.access_time, size: 18, color: AppColors.deepBlue),
          const SizedBox(width: 8),
          Text(
            "Today – $today",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.deepBlue,
            ),
          ),
        ],
      ),
    );
  }
}
