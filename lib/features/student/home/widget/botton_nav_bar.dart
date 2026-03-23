import 'package:Thapasya/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:glass_pill_nav/glass_pill_nav.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GlassPillNav(
      style: GlassPillNavStyle(
        baseColor: AppColors.brightRed,
        activeColor: AppColors.white,
        blurSigma: 50,
      ),
      items: [
        GlassPillNavItem(icon: Icons.home,label: 'Home'),
        GlassPillNavItem(icon: Icons.calendar_month,label: 'Attendance'),
        GlassPillNavItem(icon: Icons.import_contacts,label: 'Course'),
        GlassPillNavItem(icon: Icons.credit_card,label: 'Fees')
      ],
      currentIndex: currentIndex,
      onTabTap: onTap,
    );
  }
}