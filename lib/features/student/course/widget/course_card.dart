import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';
import 'package:thapasya/features/student/course/widget/info_item.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.darkRed,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.white24,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Icon(Icons.star_border, color: AppColors.white, size: 28),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Bharatanatyam",
                  style: AppFonts.poppinsSemiBold6
                ),

                const SizedBox(height: 4),

                 Text(
                  "Level 3 • Intermediate",
                  style: AppFonts.poppinsBold3,
                ),

                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    InfoItem(title: "Morning", subtitle: "Batch"),
                    InfoItem(title: "Mon/Thu", subtitle: "Day"),
                    InfoItem(title: "5:00 PM", subtitle: "Time"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
