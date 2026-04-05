import 'package:flutter/material.dart';

class PastLogCard extends StatelessWidget {
  const PastLogCard({super.key});

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "March 16, 2026",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2563EB),
                ),
              ),

              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFD1FAE5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "Submitted",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF16A34A),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          const Text(
            "Practiced Shabdam sequence. Focused on abhinaya. 5/7 students showed great improvement.",
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF4B5563),
            ),
          ),
        ],
      ),
    );
  }
}