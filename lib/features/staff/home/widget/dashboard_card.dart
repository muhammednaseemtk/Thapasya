import 'package:flutter/material.dart';
import 'package:thapasya/features/staff/home/widget/stat_item.dart';

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
        gradient: const LinearGradient(
          colors: [Color(0xFF2E5B84), Color(0xFF3C6E9E)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Good Morning",
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),

          const SizedBox(height: 6),

          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            role,
            style: const TextStyle(color: Colors.white70, fontSize: 13),
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              StatItem(icon: Icons.people, value: "24", label: "Students"),
              StatItem(
                icon: Icons.calendar_today,
                value: "3",
                label: "Today's\nClasses",
              ),
              StatItem(
                icon: Icons.access_time,
                value: "82%",
                label: "Attendance %",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
