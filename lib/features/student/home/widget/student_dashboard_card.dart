import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';
import 'package:thapasya/features/student/home/widget/course_toggle.dart';
import 'package:thapasya/features/student/home/widget/student_info_card.dart';

class StudentDashboardCard extends StatelessWidget {
  final String studentName;
  final String course;
  final String batch;
  final int attendance;
  final String pendingFee;
  final String nextClassTime;

  const StudentDashboardCard({
    super.key,
    required this.studentName,
    required this.course,
    required this.batch,
    required this.attendance,
    required this.pendingFee,
    required this.nextClassTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.darkRed,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Good Morning", style: AppFonts.poppinsRegular),

          SizedBox(height: 8),

          Text(studentName, style: AppFonts.poppinsSemiBold4),

          SizedBox(height: 8,),

          CourseToggle(),

          SizedBox(height: 6),

          Text(
            "$course - Level 3 | Batch: $batch",
            style: AppFonts.poppinsSemiBold2,
          ),

          SizedBox(height: 8),

          Row(
            children: [
              StudentInfoCard(
                icon: Icons.calendar_today,
                value: "$attendance%",
                label: "Attendance",
                labelStyle: AppFonts.poppinsBold1,
              ),
              StudentInfoCard(
                icon: Icons.currency_rupee,
                value: pendingFee,
                label: "Pending Fee",
                labelStyle: AppFonts.poppinsBold1,
              ),
              StudentInfoCard(
                icon: Icons.access_time,
                value: nextClassTime,
                label: "Next Class",
                labelStyle: AppFonts.poppinsBold1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
