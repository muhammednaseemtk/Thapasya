import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:thapasya/core/constants/app_colors.dart';

class ScheduleShimmer extends StatelessWidget {
  const ScheduleShimmer({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(1, (_) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: 12,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        );
      }),
    );
  }
}
