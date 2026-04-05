import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/features/student/attendance/widget/legend_item.dart';

class AttendanceLegend extends StatelessWidget {
  const AttendanceLegend({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        LegendItem(color: AppColors.green, label: "Present"),
        LegendItem(color: AppColors.darkRed, label: "Absent"),
        LegendItem(color: AppColors.orange, label: "Holiday"),
      ],
    );
  }
}
