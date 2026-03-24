import 'package:Thapasya/features/student/course/widget/info_item.dart';
import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF9B1C1C),
            Color(0xFFB91C1C),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ⭐ Icon
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(18)
            ),
            child: const Icon(
              Icons.star_border,
              color: Colors.white,
              size: 28,
            ),
          ),

          const SizedBox(width: 16),

          // 📄 Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Bharatanatyam",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                const Text(
                  "Level 3 • Intermediate",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 16),

                // 🔽 Bottom Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    InfoItem(
                      title: "Morning",
                      subtitle: "Batch",
                    ),
                    InfoItem(
                      title: "Mon/Thu",
                      subtitle: "Day",
                    ),
                    InfoItem(
                      title: "5:00 PM",
                      subtitle: "Time",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}