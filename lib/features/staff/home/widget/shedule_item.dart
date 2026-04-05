import 'package:flutter/material.dart';
import 'package:thapasya/core/constant/app_fonts.dart';

class ScheduleItem extends StatelessWidget {
  final String time;
  final String title;
  final String subtitle;
  final String status;
  final Color statusColor;
  final Color textColor;

  const ScheduleItem({
    super.key,
    required this.time,
    required this.title,
    required this.subtitle,
    required this.status,
    required this.statusColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 80,
          child: Text(
            time,
            style: AppFonts.poppinsRegular1
          ),
        ),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppFonts.poppinsSemiBold9
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: AppFonts.poppinsBold2,
              ),
            ],
          ),
        ),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: statusColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            status,
            style: AppFonts.poppinsBold6,
          ),
        ),
      ],
    );
  }
}