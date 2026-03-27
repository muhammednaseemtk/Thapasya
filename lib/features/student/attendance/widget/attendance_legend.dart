import 'package:Thapasya/core/constant/app_colors.dart';
import 'package:Thapasya/features/student/attendance/widget/legend_item.dart';
import 'package:flutter/material.dart';

class AttendanceLegend extends StatelessWidget {
  const AttendanceLegend({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        LegendItem(
          color: AppColors.green,
          label: "Present",
        ),
        LegendItem(
          color: AppColors.brightRed,
          label: "Absent",
        ),
        LegendItem(
          color: Colors.orange,
          label: "Holiday",
        ),
      ],
    );
  }
}
