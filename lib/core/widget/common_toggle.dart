import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';

class CommonToggle extends StatelessWidget {
  final List<String> items;
  final int selectedIndex;
  final Function(int) onTap;

  const CommonToggle({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(items.length, (index) {
          final isSelected = selectedIndex == index;

          Color bgColor = AppColors.white24;
          Color textColor = AppColors.white;

          if (isSelected) {
            bgColor = AppColors.white;
            textColor = AppColors.deepBlue;
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