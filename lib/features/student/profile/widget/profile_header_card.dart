import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';

class ProfileHeaderCard extends StatelessWidget {
  const ProfileHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        color: AppColors.darkRed,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: AppColors.white24,
            child:  Text(
              "M",
              style: AppFonts.poppinsSemiBold6,
            ),
          ),

          const SizedBox(height: 12),

           Text(
            "Midlaj",
            style: AppFonts.poppinsSemiBold6
          ),

          const SizedBox(height: 4),

           Text(
            "Student ID: TSA-2024-0145",
            style: AppFonts.poppinsBold3,
          ),

          const SizedBox(height: 12),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.white24,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.verified, color: AppColors.white, size: 18),
                SizedBox(width: 6),
                Text(
                  "Active Student",
                  style: TextStyle(color: AppColors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}