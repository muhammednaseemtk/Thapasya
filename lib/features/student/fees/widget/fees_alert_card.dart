import 'package:flutter/material.dart';
import 'package:thapasya/core/constant/app_colors.dart';
import 'package:thapasya/core/constant/app_fonts.dart';

class FeesAlertCard extends StatelessWidget {
  final String title;
  final String message;

  const FeesAlertCard({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.lightRed, 
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.brightRed,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Container(
              height: 28,
              width: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.brightRed),
              ),
              child: const Icon(
                Icons.error_outline,
                color: AppColors.brightRed,
                size: 18,
              ),
            ),
      
            const SizedBox(width: 12),
      
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppFonts.poppinsSemiBold3
                  ),
      
                  const SizedBox(height: 4),
      
                  Text(
                    message,
                    style: AppFonts.poppinsBold6
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}