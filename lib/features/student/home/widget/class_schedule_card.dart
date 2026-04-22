import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'class_schedule_item.dart';

class ClassScheduleCard extends StatelessWidget {
  const ClassScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Class Schedule",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 16),

            ClassScheduleItem(
              day: "Monday",
              subject: "Bharatanatyam",
              time: "5:00 PM",
            ),

            ClassScheduleItem(
              day: "Thursday",
              subject: "Bharatanatyam",
              time: "5:00 PM",
            ),
          ],
        ),
      ),
    );
  }
}