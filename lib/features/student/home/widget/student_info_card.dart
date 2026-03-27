import 'package:Thapasya/core/constant/app_colors.dart';
import 'package:Thapasya/core/constant/app_fonts.dart';
import 'package:flutter/material.dart';

class StudentInfoCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final TextStyle labelStyle;

  const StudentInfoCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
    required this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.white15,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.white, size: 20),
            SizedBox(height: 8),
            Text(value, style: AppFonts.poppinsBold),

            SizedBox(height: 4),

            Text(label, style: labelStyle),
          ],
        ),
      ),
    );
  }
}
