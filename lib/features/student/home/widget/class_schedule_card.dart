import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/features/student/home/model/student_schedule_model.dart';
import 'class_schedule_item.dart';

class ClassScheduleCard extends StatelessWidget {
  final List<StudentScheduleModel> schedules;
  final bool isLoading;

  const ClassScheduleCard({
    super.key,
    required this.schedules,
    required this.isLoading,
  });

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
              color: AppColors.black10,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Class Schedule",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            if (isLoading)
              const Center(child: CircularProgressIndicator())
            else if (schedules.isEmpty)
              const Text("No schedule available")
            else
              ...schedules.map(
                (e) => ClassScheduleItem(
                  day: e.day,
                  subject: e.subject,
                  time: e.time,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
