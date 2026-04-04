import 'package:flutter/material.dart';
import 'package:liquid_glass_navbar/liquid_glass_navbar.dart';
import 'package:thapasya/core/constant/app_colors.dart';
import 'package:thapasya/features/staff/assessment/view/assessment_screen.dart';
import 'package:thapasya/features/staff/attendance/view/attendance_screen.dart';
import 'package:thapasya/features/staff/home/view/home_screen.dart';
import 'package:thapasya/features/staff/log/view/log_screen.dart';
import 'package:thapasya/features/staff/students/view/students_screen.dart';


class StaffBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const StaffBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static final List<Widget> pages = [
    StaffHomeScreen(),
    StaffStudentsScreen(),
    StaffAttendanceScreen(),
    StaffAssessmentScreen(),
    StaffLogScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
      ),
      child: LiquidGlassNavBar(
        itemColor: AppColors.deepBlue,
        backgroundColor: AppColors.white,
        bubbleBorderColor: AppColors.deepBlue,
        bubbleColor: AppColors.white,
        fontSize: 12,
        bubbleWidth: 75,
        blurStrength: 85,
        bubbleHeight: 55,
        currentIndex: currentIndex,
        onPageChanged: onTap,
        pages: pages,

        items: [
          LiquidGlassNavItem(icon: Icons.home_outlined, label: 'Home'),
          LiquidGlassNavItem(icon: Icons.group_outlined, label: 'Students'),
          LiquidGlassNavItem(
            icon: Icons.calendar_today_outlined,
            label: 'Attend',
          ),
          LiquidGlassNavItem(icon: Icons.assignment_outlined, label: 'Assess'),
          LiquidGlassNavItem(icon: Icons.note_outlined, label: 'Log'),
        ],
      ),
    );
  }
}
