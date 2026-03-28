import 'package:Thapasya/core/constant/app_colors.dart';
import 'package:Thapasya/features/student/attendance/view/attendance_screen.dart';
import 'package:Thapasya/features/student/course/view/course_screen.dart';
import 'package:Thapasya/features/student/fees/view/fees_screen.dart';
import 'package:Thapasya/features/student/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:liquid_glass_navbar/liquid_glass_navbar.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static final List<Widget> pages = [
    HomeScreen(),
    AttendanceScreen(),
    CourseScreen(),
    FeesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return LiquidGlassNavBar(
      itemColor: AppColors.brightRed,
      backgroundColor: AppColors.white,
      bubbleBorderColor: AppColors.brightRed,
      bubbleColor: AppColors.white,
      fontSize: 12,
      bubbleWidth: 88,
      blurStrength: 50,
      bubbleHeight: 55,
      currentIndex: currentIndex,
      onPageChanged: onTap,
      pages: pages,
      items: [
        LiquidGlassNavItem(icon: Icons.home_outlined, label: 'Home'),
        LiquidGlassNavItem(icon: Icons.calendar_month, label: 'Attendance'),
        LiquidGlassNavItem(icon: Icons.import_contacts_outlined, label: 'Course'),
        LiquidGlassNavItem(icon: Icons.payment, label: 'Fees'),
      ],
    );
  }
}