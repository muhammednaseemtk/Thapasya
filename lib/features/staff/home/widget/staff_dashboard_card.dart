import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';
import 'package:thapasya/core/widget/common_toggle.dart';
import 'package:thapasya/features/staff/home/controller/schedule_controller.dart';
import 'package:thapasya/features/staff/home/controller/staff_course_controller.dart';

class StaffDashboardCard extends StatelessWidget {
  final String name;
  final String role;
  final int students;
  final int classes;
  final int attendance;

  const StaffDashboardCard({
    super.key,
    required this.name,
    required this.role,
    required this.students,
    required this.classes,
    required this.attendance,
  });

  @override
  Widget build(BuildContext context) {
    final courseController = context.read<StaffCourseController>();

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
          Text("Good Morning", style: AppFonts.poppinsBold7),
          const SizedBox(height: 6),
          Text(name, style: AppFonts.poppinsSemiBold6),
          const SizedBox(height: 4),
          Text(role, style: AppFonts.poppinsBold7),
          const SizedBox(height: 20),

          Consumer<StaffCourseController>(
            builder: (context, controller, _) {
              return CommonToggle(
                items: controller.courses.map((e) => e.name).toList(),
                selectedIndex: controller.selectedIndex,
                onTap: (index) {
                  controller.selectCourse(index);

                  context.read<ScheduleController>().fetchSchedule(index);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
