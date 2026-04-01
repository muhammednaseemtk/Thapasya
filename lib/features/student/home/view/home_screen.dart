import 'package:flutter/material.dart';
import 'package:thapasya/core/constant/app_colors.dart';
import 'package:thapasya/features/student/home/widget/common_app_bar.dart';
import 'package:thapasya/features/student/home/widget/recent_updates_card.dart';
import 'package:thapasya/features/student/home/widget/student_dashboard_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screen,
      appBar: CommonAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: StudentDashboardCard(
                studentName: 'Midlaj',
                course: 'Bharatanatyam',
                batch: 'Afternoon',
                attendance: 2,
                pendingFee: '2000',
                nextClassTime: '1:00 PM',
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RecentUpdatesCard(),
            ),
          ],
        ),
      ),
    );
  }
}
