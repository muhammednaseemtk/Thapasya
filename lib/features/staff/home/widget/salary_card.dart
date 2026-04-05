import 'package:flutter/material.dart';
import 'package:thapasya/core/constant/app_colors.dart';
import 'package:thapasya/core/constant/app_fonts.dart';

class SalaryCard extends StatelessWidget {
  const SalaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
       color: AppColors.amber,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text(
                "March 2026 Salary",
                style: AppFonts.poppinsBold8
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.black10,
                  borderRadius: BorderRadius.circular(20),
                ),
                child:  Text(
                  "Processing",
                  style: AppFonts.poppinsBold8,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          const Text(
            "₹38,000",
            style: AppFonts.poppinsSemiBold10,
          ),

          const SizedBox(height: 6),

           Text(
            "Credit date: April 1, 2026",
            style: AppFonts.poppinsBold6,
          ),
        ],
      ),
    );
  }
}
