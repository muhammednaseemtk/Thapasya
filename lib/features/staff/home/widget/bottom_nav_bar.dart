import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:liquid_glass_navbar/liquid_glass_navbar.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/features/staff/attendance/view/attendance_screen.dart';
import 'package:thapasya/features/staff/home/view/staff_home_screen.dart';
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
    StaffLogScreen(),
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
          LiquidGlassNavItem(icon: Iconsax.house, label: 'Home'),
          LiquidGlassNavItem(icon: Iconsax.profile_2user, label: 'Students'),
          LiquidGlassNavItem(
            icon: Iconsax.calendar_1,
            label: 'Attend',
          ),
          LiquidGlassNavItem(icon: Iconsax.document, label: 'Log'),
        ],
      ),
    );
  }
}
