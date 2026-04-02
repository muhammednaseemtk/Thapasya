import 'package:flutter/material.dart';
import 'package:thapasya/core/constant/app_colors.dart';
import 'package:thapasya/core/constant/app_fonts.dart';
import '../model/course_item.dart';

class CourseProgressItems extends StatelessWidget {
  final CourseItem item;

  const CourseProgressItems({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    Color bgColor;
    IconData icon;

    switch (item.status) {
      case "Done":
        statusColor = AppColors.green;
        bgColor = AppColors.lightGreen;
        icon = Icons.check_circle;
        break;
      case "Active":
        statusColor = AppColors.brightRed;
        bgColor = AppColors.lightRed;
        icon = Icons.trending_up;
        break;
      default:
        statusColor = AppColors.textField;
        bgColor = AppColors.lightClr;
        icon = Icons.access_time;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: bgColor,
            child: Icon(icon, color: statusColor, size: 18),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: AppFonts.poppinsSemiBold,
                ),
                Text(
                  item.subtitle,
                  style: AppFonts.poppinsBold2,
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              item.status,
              style: TextStyle(color: statusColor),
            ),
          ),
        ],
      ),
    );
  }
}