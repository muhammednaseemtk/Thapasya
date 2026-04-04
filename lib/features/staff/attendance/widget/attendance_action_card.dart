import 'package:flutter/material.dart';

class AttendanceActionCard extends StatelessWidget {
  const AttendanceActionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F5F7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
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

          const Expanded(
            child: Column(
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
          ),

          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFD1FAE5), 
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.check,
              color: Color(0xFF16A34A),
            ),
          ),

          const SizedBox(width: 8),

          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFFEE2E2), 
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.close,
              color: Color(0xFFDC2626),
            ),
          ),
        ],
      ),
    );
  }
}