import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:thapasya/core/constants/app_colors.dart';

class ClassScheduleShimmer extends StatelessWidget {
  const ClassScheduleShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        children: List.generate(2, (index) {
          return Container(
            padding: const EdgeInsets.all(14),
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      height: 16,
                      color: AppColors.white,
                    ),
                    const SizedBox(height: 4),
                    Container(
                      width: 120,
                      height: 13,
                      color: AppColors.white,
                    ),
                  ],
                ),
                Container(
                  width: 50,
                  height: 14,
                  color: AppColors.white,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
