import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
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
      appBar: CommonAppBar(color: AppColors.deepBlue,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AttendanceHeader(),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: BatchInfoCard(),
            ),

            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AttendanceActionCard(),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AttendanceActionCard(),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AttendanceActionCard(),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AttendanceActionCard(),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AttendanceActionCard(),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AttendanceSummary(),
            ),

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
    );
  }
}
