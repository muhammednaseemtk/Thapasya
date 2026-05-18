import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:thapasya/core/constants/app_colors.dart';

class ClassLogShimmer extends StatelessWidget {
  const ClassLogShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        children: List.generate(3, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  color: AppColors.white,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 60,
                        height: 12,
                        color: AppColors.white,
                      ),
                      const SizedBox(height: 4),
                      Container(
                        width: double.infinity,
                        height: 14,
                        color: AppColors.white,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 20,
                  height: 20,
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
