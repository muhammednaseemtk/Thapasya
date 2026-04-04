import 'package:flutter/material.dart';
import 'package:thapasya/core/constant/app_colors.dart';
import 'package:thapasya/features/staff/home/widget/common_app_bar.dart';
import 'package:thapasya/features/staff/students/widget/student_progress_card.dart';

class StaffStudentsScreen extends StatelessWidget {
  const StaffStudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screen,
      appBar: StaffCommonAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "My Students",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
              
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white70,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "6 total",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            StudentProgressCard(progressColor: AppColors.darkRed),
            StudentProgressCard(progressColor: AppColors.green),
            StudentProgressCard(progressColor: AppColors.darkRed),
            StudentProgressCard(progressColor: AppColors.green),
            StudentProgressCard(progressColor: AppColors.darkRed),
            StudentProgressCard(progressColor: AppColors.green),
            StudentProgressCard(progressColor: AppColors.darkRed),
            StudentProgressCard(progressColor: AppColors.green),
          ],
        ),
      ),
    );
  }
}
