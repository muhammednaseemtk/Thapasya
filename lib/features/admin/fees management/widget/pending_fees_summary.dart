import 'package:flutter/material.dart';
import 'pending_fees_item.dart';

class PendingFeesSummary extends StatelessWidget {
  const PendingFeesSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Pending Fees Summary",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 12),

          PendingFeesItem(
            name: "Priya Sharma",
            details: "2024001 • Class 10-A",
            amount: "₹15,000",
          ),

          PendingFeesItem(
            name: "Rahul Kumar",
            details: "2024002 • Class 9-B",
            amount: "₹42,000",
          ),

          PendingFeesItem(
            name: "Sneha Iyer",
            details: "2024005 • Class 12-A",
            amount: "₹25,000",
          ),
        ],
      ),
    );
  }
}