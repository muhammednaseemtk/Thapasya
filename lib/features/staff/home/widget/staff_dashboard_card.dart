import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';
import 'package:thapasya/core/widget/common_toggle.dart';
import 'package:thapasya/core/widget/common_toggle_shimmer.dart';

class StaffDashboardCard extends StatelessWidget {
  final String name;
  final int students;
  final int classes;
  final int attendance;
  final List<String> courseNames;
  final int selectedCourseIndex;
  final bool isLoading;
  final Function(int) onCourseTap;

  const StaffDashboardCard({
    super.key,
    required this.name,
    required this.students,
    required this.classes,
    required this.attendance,
    required this.courseNames,
    required this.selectedCourseIndex,
    required this.isLoading,
    required this.onCourseTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.black10,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        color: AppColors.deepBlue,
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: AppFonts.poppinsSemiBold6),

          const SizedBox(height: 20),

          if (isLoading)
            const CommonToggleShimmer()
          else if (courseNames.isNotEmpty)
            CommonToggle(
              items: courseNames,
              selectedIndex: selectedCourseIndex,
              onTap: onCourseTap,
            ),
        ],
      ),
    );
  }
}
