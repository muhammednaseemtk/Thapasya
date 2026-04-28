import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/routes/app_routes.dart';
import 'package:thapasya/core/widget/common_app_bar.dart';
import 'package:thapasya/features/student/home/widget/class_schedule_card.dart';
import 'package:thapasya/features/student/home/widget/recent_class_logs_card.dart';
import 'package:thapasya/features/student/home/widget/student_dashboard_card.dart';

class StudentHomeScreen extends StatelessWidget {
  const StudentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screen,
      appBar: CommonAppBar(color: AppColors.darkRed,onProfileTap: () {
        Navigator.pushNamed(context, AppRoutes.studentProfile);
      },),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
          child: Column(
            children: [
              StudentDashboardCard(
                studentName: 'Midlaj',
                course: 'Bharatanatyam',
                batch: 'Afternoon',
                attendance: 2,
                pendingFee: '2000',
                nextClassTime: '1:00 PM',
              ),

              SizedBox(height: 20,),

              ClassScheduleCard(),

              SizedBox(height: 20,),
                
              RecentClassLogsCard(),
            ],
          ),
        ),
      ),
    );
  }
}
