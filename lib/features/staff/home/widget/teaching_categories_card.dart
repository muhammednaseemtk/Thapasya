import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thapasya/core/constant/app_colors.dart';
import 'package:thapasya/core/constant/app_fonts.dart';
import 'package:thapasya/features/staff/home/controller/category_controller.dart';
import 'package:thapasya/features/staff/home/widget/category_item.dart';

class TeachingCategoriesCard extends StatelessWidget {
  const TeachingCategoriesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryController>(
      builder: (context, controller, child) {
        final categories = [
          {"title": "Bharatanatyam", "students": 8},
          {"title": "Carnatic Music", "students": 6},
          {"title": "Fine Arts", "students": 5},
          {"title": "Yoga", "students": 5},
        ];

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                "Teaching Categories",
                style: AppFonts.poppinsSemiBold7
              ),
              const SizedBox(height: 12),

              ...List.generate(categories.length, (index) {
                final item = categories[index];

                return GestureDetector(
                  onTap: () {
                    controller.selectIndex(index);
                  },
                  child: CategoryItem(
                    title: item["title"] as String,
                    students: item["students"] as int,
                    isSelected: controller.selectedIndex == index,
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }
}