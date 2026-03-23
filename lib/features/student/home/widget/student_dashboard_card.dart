import 'package:Thapasya/core/constant/app_colors.dart';
import 'package:Thapasya/features/student/home/widget/student_info_card.dart';
import 'package:flutter/material.dart';

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
        color: AppColors.brightRed,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            "Good Morning 👋",
            style: TextStyle(
              color: AppColors.white,
              fontSize: 14,
            ),
          ),

           SizedBox(height: 8),

          Text(
            studentName,
            style:  TextStyle(
              color: AppColors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

           SizedBox(height: 6),

          Text(
            "$course - $batch",
            style:  TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),

          SizedBox(height: 8,),

          Row(
            children: [
              StudentInfoCard(
                icon: Icons.calendar_today,
                value: "$attendance%",
                label: "Attendance",
              ),
              StudentInfoCard(
                icon: Icons.currency_rupee,
                value: pendingFee,
                label: "Pending Fee",
              ),
              StudentInfoCard(
                icon: Icons.access_time,
                value: nextClassTime,
                label: "Next Class",
              ),
            ],
          )
        ],
      ),
    );
  }
}