import 'package:flutter/material.dart';

class BatchInfoCard extends StatelessWidget {
  const BatchInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFEDEDED),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFD1D5DB),
        ),
      ),
      child: Row(
        children: const [
          Icon(
            Icons.calendar_today_outlined,
            size: 18,
            color: Color(0xFF1D4ED8),
          ),

          SizedBox(width: 10),

          Expanded(
            child: Text(
              "Bharatanatyam – Batch B – 2:00 PM",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1F2937),
              ),
            ),
          ),
        ],
      ),
    );
  }
}