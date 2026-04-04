import 'package:flutter/material.dart';
import 'package:thapasya/core/constant/app_colors.dart';
import 'package:thapasya/core/constant/app_fonts.dart';

class DashBoardItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const DashBoardItem({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.symmetric(vertical: 16,),
        decoration: BoxDecoration(
          color: AppColors.white24,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppColors.white, size: 20),
            const SizedBox(height: 8),
            Text(
              value,
              style: AppFonts.poppinsSemiBold8
            ),
            const SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              style: AppFonts.poppinsBold7
            ),
          ],
        ),
      ),
    );
  }
}