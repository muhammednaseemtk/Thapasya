import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final int students;
  final bool isSelected;

  const CategoryItem({
    super.key,
    required this.title,
    required this.students,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.lightBlue
            : AppColors.screen,
        borderRadius: BorderRadius.circular(16),
        border: isSelected
            ? Border.all(color: AppColors.deepBlue)
            : null,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: AppFonts.poppinsBold8
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "$students students",
              style: AppFonts.poppinsBold2,
            ),
          ),

          const SizedBox(width: 8),

          if (isSelected)
            const Icon(
              Icons.check_circle,
              color: AppColors.deepBlue,
              size: 18,
            ),
        ],
      ),
    );
  }
}