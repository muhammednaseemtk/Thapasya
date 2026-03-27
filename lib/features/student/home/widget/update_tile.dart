import 'package:Thapasya/core/constant/app_colors.dart';
import 'package:Thapasya/core/constant/app_fonts.dart';
import 'package:flutter/material.dart';

class UpdateTile extends StatelessWidget {
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;
  final String title;
  final String subtitle;
  final bool showDot;

  const UpdateTile({
    super.key,
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    this.showDot = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: iconBgColor,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: iconColor, size: 18),
        ),

         SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:  AppFonts.poppinsSemiBold
              ),
               SizedBox(height: 4),
              Text(
                subtitle,
                style: AppFonts.poppinsBold2
              ),
            ],
          ),
        ),

        if (showDot)
          Container(
            width: 8,
            height: 8,
            decoration:  BoxDecoration(
              color: AppColors.brightRed,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }
}