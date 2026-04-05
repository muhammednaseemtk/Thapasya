import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';
import 'package:thapasya/features/staff/home/widget/shedule_item.dart';

class TodayScheduleCard extends StatelessWidget {
  const TodayScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Today's Schedule",
            style: AppFonts.poppinsSemiBold7
          ),
          SizedBox(height: 16),

          ScheduleItem(
            time: "10:00 AM",
            title: "Bharatanatyam",
            subtitle: "Batch A • 8 students",
            status: "Done",
            statusColor: AppColors.lightGreen,
            textColor: AppColors.green,
          ),

          Divider(height: 24),

          ScheduleItem(
            time: "2:00 PM",
            title: "Bharatanatyam",
            subtitle: "Batch B • 7 students",
            status: "Now",
            statusColor: AppColors.lightBlue,
            textColor: AppColors.deepBlue,
          ),

          Divider(height: 24),

          ScheduleItem(
            time: "5:00 PM",
            title: "Carnatic Music",
            subtitle: "Batch C • 6 students",
            status: "Soon",
            statusColor: AppColors.lightClr,
            textColor: AppColors.lightTxt,
          ),
        ],
      ),
    );
  }
}