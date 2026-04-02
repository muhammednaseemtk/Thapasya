import 'package:flutter/material.dart';
import 'package:thapasya/core/constant/app_fonts.dart';

class FeesSummaryCard extends StatelessWidget {
  final String title;
  final String amount;
  final String subtitle;
  final Color bgColor;
  final Color textColor;

  const FeesSummaryCard({
    super.key,
    required this.title,
    required this.amount,
    required this.subtitle,
    required this.bgColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: 175,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppFonts.poppinsSemiBold2.copyWith(
                color: textColor,
                fontSize: 13,
              ),
            ),
      
            const SizedBox(height: 10),
      
            Text(
              amount,
              style: AppFonts.poppinsSemiBold2.copyWith(
                color: textColor,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
      
            const SizedBox(height: 6),
      
            Text(
              subtitle,
              style: AppFonts.poppinsSemiBold2.copyWith(
                color: textColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}