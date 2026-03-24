import 'package:Thapasya/features/student/attendance/model/monthly_data.dart';
import 'package:Thapasya/features/student/attendance/widget/montly_progress_item.dart';
import 'package:flutter/material.dart';


class MonthlyBreakdownCard extends StatelessWidget {
  MonthlyBreakdownCard({super.key});

  final List<MonthlyData> data = [
    MonthlyData(month: "Oct", present: 14, total: 16),
    MonthlyData(month: "Nov", present: 13, total: 15),
    MonthlyData(month: "Dec", present: 12, total: 14),
    MonthlyData(month: "Jan", present: 15, total: 16),
    MonthlyData(month: "Feb", present: 14, total: 16),
    MonthlyData(month: "Mar", present: 10, total: 12),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Monthly Breakdown",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          ...data.map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: MonthlyProgressItem(data: e),
              )),
        ],
      ),
    );
  }
}