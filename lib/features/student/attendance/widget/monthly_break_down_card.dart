import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';
import 'package:thapasya/features/student/attendance/model/monthly_data.dart';
import 'package:thapasya/features/student/attendance/widget/montly_progress_item.dart';

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
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Monthly Breakdown",
            style: AppFonts.poppinsSemiBold7,
          ),
          const SizedBox(height: 16),

          ...data.map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: MonthlyProgressItem(data: e),
            ),
          ),
        ],
      ),
    );
  }
}
