import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/routes/app_routes.dart';
import 'package:thapasya/core/widget/common_button.dart';
import 'package:thapasya/features/staff/attendance/widget/attendance_action_card.dart';
import 'package:thapasya/features/staff/attendance/widget/attendance_header.dart';
import 'package:thapasya/features/staff/attendance/widget/attendance_summary.dart';
import 'package:thapasya/features/staff/attendance/widget/batch_info_card.dart';
import 'package:thapasya/core/widget/common_app_bar.dart';

class StaffAttendanceScreen extends StatelessWidget {
  const StaffAttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screen,
      appBar: CommonAppBar(color: AppColors.deepBlue,onProfileTap: () {
        Navigator.pushNamed(context, AppRoutes.staffProfile);
      },),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
          child: Column(
            children: [
              AttendanceHeader(),

              SizedBox(height: 10),
          
              BatchInfoCard(),
          
              SizedBox(height: 10),
          
              AttendanceActionCard(),

              SizedBox(height: 10),
          
              AttendanceActionCard(),

              SizedBox(height: 10),
          
              AttendanceActionCard(),

              SizedBox(height: 10),
          
              AttendanceActionCard(),

              SizedBox(height: 10),
          
              AttendanceActionCard(),

              SizedBox(height: 10),
          
              AttendanceSummary(),
          
              SizedBox(height: 10,),
          
              CommonButton(
                onPressed: () {},
                backgroundColor: AppColors.deepBlue,
                width: 350,
                txt: 'Submit Attendance',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
