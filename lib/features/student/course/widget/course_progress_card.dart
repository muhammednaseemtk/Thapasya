import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:thapasya/core/constant/app_colors.dart';
import 'package:thapasya/core/constant/app_fonts.dart';
import 'package:thapasya/features/student/course/model/course_item.dart';
import 'package:thapasya/features/student/course/widget/course_progress_items.dart';

class CourseProgressCard extends StatelessWidget {
  final double progress;
  final List<CourseItem> items;

  const CourseProgressCard({
    super.key,
    required this.progress,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Course Progress",
              style: AppFonts.poppinsSemiBold7,
            ),

            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text("Overall Progress",style: AppFonts.poppinsBold2
                 ),

                Text(
                  "${(progress * 100).toInt()}%",
                  style: AppFonts.poppinsSemiBold3,
                ),
              ],
            ),

            const SizedBox(height: 8),

            LinearPercentIndicator(
              lineHeight: 8,
              percent: progress,
              backgroundColor: AppColors.screen,
              linearGradient: const LinearGradient(
                colors: [AppColors.brightRed, AppColors.orange, AppColors.amber],
              ),
              barRadius: const Radius.circular(10),
            ),

            const SizedBox(height: 20),

            ...items.map((e) => CourseProgressItems(item: e)),
          ],
        ),
      ),
    );
  }
}
