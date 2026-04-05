import 'package:flutter/material.dart';

class StudentAssessmentCard extends StatelessWidget {
  const StudentAssessmentCard({super.key});

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
          Row(
            children: [
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFF2F5D82),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Center(
                  child: Text(
                    "PK",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Priya Krishnamurthy",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Level 3",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),

          const Text(
            "Performance Rating",
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF6B7280),
            ),
          ),

          const SizedBox(height: 8),

          Row(
            children: const [
              Icon(Icons.star_border, color: Colors.grey),
              Icon(Icons.star_border, color: Colors.grey),
              Icon(Icons.star_border, color: Colors.grey),
              Icon(Icons.star_border, color: Colors.grey),
              Icon(Icons.star_border, color: Colors.grey),
            ],
          ),

          const SizedBox(height: 16),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFEDE7DD),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText:
                    "Add notes (e.g., 'Great improvement in mudras...')",
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}