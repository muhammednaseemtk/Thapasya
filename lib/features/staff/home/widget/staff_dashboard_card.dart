import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';
import 'package:thapasya/core/widget/common_toggle.dart';
import 'package:thapasya/core/widget/common_toggle_shimmer.dart';
import 'package:thapasya/features/staff/home/controller/schedule_controller.dart';
import 'package:thapasya/features/staff/home/controller/staff_course_controller.dart';

class StaffDashboardCard extends StatelessWidget {
  final String name;
  final int students;
  final int classes;
  final int attendance;

  const StaffDashboardCard({
    super.key,
    required this.name,
    required this.students,
    required this.classes,
    required this.attendance,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final padding = screenWidth * 0.05;
    final spacingMedium = screenWidth * 0.05;

    return Container(
      width: double.maxFinite,

      padding: EdgeInsets.all(padding),

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

          SizedBox(height: spacingMedium),

          Consumer2<StaffCourseController, ScheduleController>(
            builder: (context, courseController, scheduleController, child) {
              if (courseController.isLoading) {
                return const CommonToggleShimmer();
              }

              return CommonToggle(
                items: courseController.courses.map((e) => e.name).toList(),

                selectedIndex: courseController.selectedIndex,

                onTap: (index) {
                  courseController.selectCourse(index);

                  scheduleController.fetchSchedule(index);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
