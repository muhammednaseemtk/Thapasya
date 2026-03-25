import 'package:Thapasya/features/auth/controller/login_tab_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginTabBarItem extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final IconData icon;
  final String text;

  const LoginTabBarItem({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final controller = context.read<LoginTabBarController>();
    final bool isSelected = selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => controller.changeTab(index),
        child: AnimatedContainer(
          duration:  Duration(milliseconds: 250),
          padding:  EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(11),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 6,
                      offset:  Offset(0, 2),
                    )
                  ]
                : [],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 18,
                color: isSelected ? Colors.red : Colors.grey,
              ),
               SizedBox(width: 6),
              Text(
                text,
                style: TextStyle(
                  color: isSelected ? Colors.red : Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}