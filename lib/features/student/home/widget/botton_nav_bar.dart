import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

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
    return FloatingNavbar(
      currentIndex: currentIndex,
      onTap: onTap,

      items:  [
        FloatingNavbarItem(
          icon: Icons.home_outlined,
        ),
        FloatingNavbarItem(
          icon: Icons.menu_book_sharp,
        ),
      ],

      backgroundColor: Colors.white,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      borderRadius: 30,
    );
  }
}