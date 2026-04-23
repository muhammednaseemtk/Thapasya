import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/routes/app_routes.dart';
import 'package:thapasya/core/widget/common_app_bar.dart';
import 'package:thapasya/features/staff/home/widget/staff_dashboard_card.dart';
import 'package:thapasya/features/staff/home/widget/today_scheduled_card.dart';

class StaffHomeScreen extends StatelessWidget {
  const StaffHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screen,
      appBar: CommonAppBar(color: AppColors.deepBlue,onProfileTap: () {
        Navigator.pushNamed(context, AppRoutes.staffProfile);
      },),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: StaffDashboardCard(
                name: "Smt. Kavitha Rajan",
                role: "Bharatanatyam Faculty | Senior Instructor",
                students: 24,
                classes: 3,
                attendance: 82,
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TeachingCategoriesCard(),
            // ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TodayScheduleCard(),
            ),

            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: SalaryCard(),
            // )
          ],
        ),
      ),
    );
  }
}
