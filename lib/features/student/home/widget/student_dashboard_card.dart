import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';
import 'package:thapasya/core/widget/common_toggle.dart';
import 'package:thapasya/core/widget/common_toggle_shimmer.dart';

class StudentDashboardCard extends StatelessWidget {
  final String studentName;
  final String greeting;
  final List<String> courseNames;
  final int selectedCourseIndex;
  final bool isLoading;
  final Function(int) onCourseTap;

  const StudentDashboardCard({
    super.key,
    required this.studentName,
    required this.greeting,
    required this.courseNames,
    required this.selectedCourseIndex,
    required this.isLoading,
    required this.onCourseTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.darkRed,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(greeting, style: AppFonts.poppinsRegular),

          SizedBox(height: 8),

          Text(studentName, style: AppFonts.poppinsSemiBold4),

          SizedBox(height: 12),

          if (isLoading)
            const CommonToggleShimmer()
          else if (courseNames.isNotEmpty)
            CommonToggle(
              items: courseNames,
              selectedIndex: selectedCourseIndex,
              onTap: onCourseTap,
              selectedTextColor: AppColors.darkRed,
            ),

          SizedBox(height: 8),
        ],
      ),
    );
  }
}
