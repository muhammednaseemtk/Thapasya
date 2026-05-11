import 'package:flutter/material.dart';

class ClassSummaryCard extends StatelessWidget {
  final String txt;
  const ClassSummaryCard({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F5F7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            txt,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2C2C2C),
            ),
          ),

          const SizedBox(height: 12),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFEDE7DD),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const TextField(
              maxLines: 2,
              decoration: InputDecoration(
                hintText:
                    "Describe today's class activities, topics covered, student progress, any observations...",
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
