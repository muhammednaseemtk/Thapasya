import 'package:Thapasya/core/constant/app_colors.dart';
import 'package:Thapasya/core/constant/app_fonts.dart';
import 'package:flutter/material.dart';
import 'update_tile.dart';

class RecentUpdatesCard extends StatelessWidget {
  const RecentUpdatesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:  AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text(
                "Recent Updates",
                style: AppFonts.poppinsSemiBold
              ),
              Text(
                "See all",
                style: AppFonts.poppinsSemiBold3
              ),
            ],
          ),

           SizedBox(height: 16),

           UpdateTile(
            icon: Icons.info_outline,
            iconBgColor: AppColors.lightRed,
            iconColor: AppColors.brightRed,
            title: "Fee Due Reminder",
            subtitle: "Your monthly fee of ₹2,500 is due on March 25.",
            showDot: true,
          ),

           SizedBox(height: 12),
           Divider(),

           SizedBox(height: 12),

           UpdateTile(
            icon: Icons.notifications_none,
            iconBgColor: AppColors.lightRed,
            iconColor: AppColors.brightRed,
            title: "Class Rescheduled",
            subtitle: "Thursday Bharatanatyam class moved to Friday 5 PM.",
            showDot: true,
          ),

           SizedBox(height: 12),
           Divider(),
           SizedBox(height: 12),

           UpdateTile(
            icon: Icons.check_circle_outline,
            iconBgColor: AppColors.lightGreen,
            iconColor: AppColors.green,
            title: "Attendance Marked",
            subtitle:
                "Your attendance for today's session has been recorded.",
          ),

          SizedBox(height: 12),
           Divider(),

          UpdateTile(
            icon: Icons.info_outline,
            iconBgColor: AppColors.lightRed,
            iconColor: AppColors.brightRed,
            title: "Fee Due Reminder",
            subtitle: "Your monthly fee of ₹2,500 is due on March 25.",
            showDot: true,
          ),
        ],
      ),
    );
  }
}