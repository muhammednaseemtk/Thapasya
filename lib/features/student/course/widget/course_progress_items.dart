import 'package:flutter/material.dart';
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
        statusColor = Colors.green;
        bgColor = Colors.green.shade50;
        icon = Icons.check_circle;
        break;
      case "Active":
        statusColor = Colors.red;
        bgColor = Colors.red.shade50;
        icon = Icons.trending_up;
        break;
      default:
        statusColor = Colors.grey;
        bgColor = Colors.grey.shade200;
        icon = Icons.access_time;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          /// Icon Circle
          CircleAvatar(
            radius: 18,
            backgroundColor: bgColor,
            child: Icon(icon, color: statusColor, size: 18),
          ),

          const SizedBox(width: 12),

          /// Text Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Text(
                  item.subtitle,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),

          /// Status Badge
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