import 'package:flutter/material.dart';
import 'update_tile.dart';

class RecentUpdatesCard extends StatelessWidget {
  const RecentUpdatesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:  Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text(
                "Recent Updates",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                "See all",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

           SizedBox(height: 16),

           UpdateTile(
            icon: Icons.info_outline,
            iconBgColor: Color(0xFFFFE5E5),
            iconColor: Colors.red,
            title: "Fee Due Reminder",
            subtitle: "Your monthly fee of ₹2,500 is due on March 25.",
            showDot: true,
          ),

           SizedBox(height: 12),
           Divider(),

           SizedBox(height: 12),

           UpdateTile(
            icon: Icons.notifications_none,
            iconBgColor: Color(0xFFFFE5E5),
            iconColor: Colors.red,
            title: "Class Rescheduled",
            subtitle: "Thursday Bharatanatyam class moved to Friday 5 PM.",
            showDot: true,
          ),

           SizedBox(height: 12),
           Divider(),
           SizedBox(height: 12),

           UpdateTile(
            icon: Icons.check_circle_outline,
            iconBgColor: Color(0xFFE6F4EA),
            iconColor: Colors.green,
            title: "Attendance Marked",
            subtitle:
                "Your attendance for today's session has been recorded.",
          ),

          SizedBox(height: 12),
           Divider(),

          UpdateTile(
            icon: Icons.info_outline,
            iconBgColor: Color(0xFFFFE5E5),
            iconColor: Colors.red,
            title: "Fee Due Reminder",
            subtitle: "Your monthly fee of ₹2,500 is due on March 25.",
            showDot: true,
          ),
        ],
      ),
    );
  }
}