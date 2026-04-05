import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';

class StudentProgressCard extends StatelessWidget {
  final Color progressColor; 

  const StudentProgressCard({
    super.key,
   required this.progressColor, 
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: AppColors.deepBlue,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Center(
                child: Text(
                  "PK",
                  style: AppFonts.poppinsSemiBold2
                ),
              ),
            ),
      
            const SizedBox(width: 12),
      
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      Text(
                        "Priya Krishnamurthy",
                        style: AppFonts.poppinsSemiBold9
                      ),
                      Text(
                        "Today",
                        style: AppFonts.poppinsBold9
                      ),
                    ],
                  ),
      
                  const SizedBox(height: 4),
      
                   Text(
                    "TSA-001 • Level 3",
                    style: AppFonts.poppinsBold2
                  ),
      
                  const SizedBox(height: 10),
      
                  Row(
                    children: [
                      Expanded(
                        child: LinearPercentIndicator(
                          padding: EdgeInsets.zero,
                          lineHeight: 6,
                          percent: 0.87,
                          barRadius: const Radius.circular(10),
                          backgroundColor: AppColors.screen,
                          progressColor: progressColor, 
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "87%",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: progressColor, 
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
      
            const SizedBox(width: 8),
      
            const Icon(
              Icons.chevron_right,
              color: AppColors.grey,
            ),
          ],
        ),
      ),
    );
  }
}