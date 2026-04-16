import 'package:flutter/material.dart';
import 'activity_item.dart';

class RecentActivity extends StatelessWidget {
  const RecentActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Recent Activity",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 16),

          ActivityItem(
            title: "New student enrollment",
            subtitle: "Priya Sharma",
            time: "2 hours ago",
          ),
          ActivityItem(
            title: "Fee payment received",
            subtitle: "Rahul Kumar",
            time: "4 hours ago",
          ),
          ActivityItem(
            title: "Staff salary processed",
            subtitle: "Dr. Anjali Verma",
            time: "6 hours ago",
          ),
          ActivityItem(
            title: "Programme booking request",
            subtitle: "Annual Day Event",
            time: "1 day ago",
            showDivider: false,
          ),
        ],
      ),
    );
  }
}