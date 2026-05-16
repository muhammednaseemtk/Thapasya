import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';

class CommonToggle extends StatelessWidget {
  final List<String> items;
  final int selectedIndex;
  final Function(int) onTap;
  final Color? unselectedBgColor;
  final Color? unselectedTextColor;
  final Color? selectedBgColor;
  final Color? selectedTextColor;

  const CommonToggle({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onTap,
    this.unselectedBgColor,
    this.unselectedTextColor,
    this.selectedBgColor,
    this.selectedTextColor,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(items.length, (index) {
          final isSelected = selectedIndex == index;

          Color bgColor = unselectedBgColor ?? AppColors.white24;
          Color textColor = unselectedTextColor ?? AppColors.white;

          if (isSelected) {
            bgColor = selectedBgColor ?? AppColors.white;
            textColor = selectedTextColor ?? AppColors.deepBlue;
          }

          return GestureDetector(
            onTap: () => onTap(index),
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: bgColor, 
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                items[index],
                style: AppFonts.poppinsSemiBold2.copyWith(
                  color: textColor,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
