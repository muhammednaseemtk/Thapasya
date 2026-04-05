import 'package:flutter/material.dart';
import 'package:liquid_glass_navbar/liquid_glass_navbar.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/features/student/attendance/view/attendance_screen.dart';
import 'package:thapasya/features/student/course/view/course_screen.dart';
import 'package:thapasya/features/student/fees/view/fees_screen.dart';
import 'package:thapasya/features/student/home/view/home_screen.dart';

class StudentBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const StudentBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static final List<Widget> pages = [
    StudentHomeScreen(),
    StudentAttendanceScreen(),
    StudentCourseScreen(),
    StudentFeesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
      ),
      child: LiquidGlassNavBar(
        itemColor: AppColors.darkRed,
        backgroundColor: AppColors.white,
        bubbleBorderColor: AppColors.darkRed,
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
          LiquidGlassNavItem(icon: Icons.calendar_month, label: 'Attend'),
          LiquidGlassNavItem(
            icon: Icons.import_contacts_outlined,
            label: 'Course',
          ),
          LiquidGlassNavItem(icon: Icons.payment, label: 'Fees'),
        ],
      ),
    );
  }
}
