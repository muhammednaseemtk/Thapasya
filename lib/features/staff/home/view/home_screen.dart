import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/features/staff/home/widget/common_app_bar.dart';
import 'package:thapasya/features/staff/home/widget/dashboard_card.dart';
import 'package:thapasya/features/staff/home/widget/salary_card.dart';
import 'package:thapasya/features/staff/home/widget/teaching_categories_card.dart';
import 'package:thapasya/features/staff/home/widget/today_scheduled_card.dart';

class StaffHomeScreen extends StatelessWidget {
  const StaffHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screen,
      appBar: StaffCommonAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DashboardCard(
                name: "Smt. Kavitha Rajan",
                role: "Bharatanatyam Faculty | Senior Instructor",
                students: 24,
                classes: 3,
                attendance: 82,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TeachingCategoriesCard(),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TodayScheduleCard(),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SalaryCard(),
            )
          ],
        ),
      ),
    );
  }
}
