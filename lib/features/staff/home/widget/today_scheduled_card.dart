import 'package:flutter/material.dart';
import 'package:thapasya/features/staff/home/widget/shedule_item.dart';

class TodayScheduleCard extends StatelessWidget {
  const TodayScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Today's Schedule",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16),

          ScheduleItem(
            time: "10:00 AM",
            title: "Bharatanatyam",
            subtitle: "Batch A • 8 students",
            status: "Done",
            statusColor: Color(0xFFDFF5E3),
            textColor: Color(0xFF2E7D32),
          ),

          Divider(height: 24),

          ScheduleItem(
            time: "2:00 PM",
            title: "Bharatanatyam",
            subtitle: "Batch B • 7 students",
            status: "Now",
            statusColor: Color(0xFFE3EAFD),
            textColor: Color(0xFF1E4DB7),
          ),

          Divider(height: 24),

          ScheduleItem(
            time: "5:00 PM",
            title: "Carnatic Music",
            subtitle: "Batch C • 6 students",
            status: "Soon",
            statusColor: Color(0xFFEAEAEA),
            textColor: Color(0xFF616161),
          ),
        ],
      ),
    );
  }
}