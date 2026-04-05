import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';
import 'package:thapasya/features/staff/home/widget/dashboard_item.dart';

class DashboardCard extends StatelessWidget {
  final String name;
  final String role;
  final int students;
  final int classes;
  final int attendance;

  const DashboardCard({
    super.key,
    required this.name,
    required this.role,
    required this.students,
    required this.classes,
    required this.attendance,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
       color: AppColors.deepBlue
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            "Good Morning",
            style: AppFonts.poppinsBold7,
          ),

          const SizedBox(height: 6),

          Text(
            name,
            style: AppFonts.poppinsSemiBold6
          ),

          const SizedBox(height: 4),

          Text(
            role,
            style: AppFonts.poppinsBold7,
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              DashBoardItem(icon: Icons.people, value: "24", label: "Students"),
              DashBoardItem(
                icon: Icons.calendar_today,
                value: "3",
                label: "Today's Class",
              ),
              DashBoardItem(
                icon: Icons.access_time,
                value: "82%",
                label: "Attendance",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
