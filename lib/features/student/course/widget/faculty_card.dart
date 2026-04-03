import 'package:flutter/material.dart';
import 'package:thapasya/core/constant/app_colors.dart';
import 'package:thapasya/core/constant/app_fonts.dart';

class FacultyCard extends StatelessWidget {
  final String initials;
  final String name;
  final String role;
  final double rating;

  const FacultyCard({
    super.key,
    required this.initials,
    required this.name,
    required this.role,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.darkRed,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              "Faculty",
              style: AppFonts.poppinsSemiBold8
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: AppColors.white24,
                  child: Text(
                    initials,
                    style: AppFonts.poppinsSemiBold5,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: AppFonts.poppinsBold1,
                      ),
                      Text(
                        role,
                        style: AppFonts.poppinsBold3,
                      ),

                      const SizedBox(height: 6),

                      Row(
                        children: [
                          ...List.generate(
                            5,
                            (index) => const Icon(
                              Icons.star,
                              color: AppColors.amber,
                              size: 16,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            rating.toStringAsFixed(1),
                            style:  AppFonts.poppinsBold,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
