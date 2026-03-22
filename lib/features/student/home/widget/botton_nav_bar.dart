import 'package:flutter/material.dart';
import 'package:glass_one_nav_bar/glass_one_nav_bar.dart';

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
    return GlassOneNavBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        GlassOneNavItem(
          icon: Icons.home_outlined,
          activeIcon: Icons.home_rounded,
          label: 'Home',
        ),
        GlassOneNavItem(
          icon: Icons.explore_outlined,
          activeIcon: Icons.explore_rounded,
          label: 'Explore',
        ),
        GlassOneNavItem(
          icon: Icons.settings_outlined,
          activeIcon: Icons.settings_rounded,
          label: 'Settings',
        ),
      ],
    );
  }
}
