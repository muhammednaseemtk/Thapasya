import 'package:flutter/material.dart';

class ActivityItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final bool showDivider;

  const ActivityItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            Text(
              time,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        if (showDivider)
          Divider(color: Colors.grey.shade200),

        if (showDivider) const SizedBox(height: 12),
      ],
    );
  }
}