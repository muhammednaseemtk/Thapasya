import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';
import 'package:thapasya/core/widget/common_app_bar.dart';
import 'package:thapasya/features/student/attendance/model/attendance_status.dart';
import 'package:thapasya/features/student/attendance/widget/attendance_calender.dart';
import 'package:thapasya/features/student/attendance/widget/attendance_card.dart';
import 'package:thapasya/features/student/attendance/widget/monthly_break_down_card.dart';

class StudentAttendanceScreen extends StatelessWidget {
  StudentAttendanceScreen({super.key});

  final Map<DateTime, AttendanceStatus> data = {
    DateTime(2026, 3, 1): AttendanceStatus.present,
    DateTime(2026, 3, 2): AttendanceStatus.holiday,
    DateTime(2026, 3, 3): AttendanceStatus.present,
    DateTime(2026, 3, 4): AttendanceStatus.present,
    DateTime(2026, 3, 5): AttendanceStatus.absent,
    DateTime(2026, 3, 6): AttendanceStatus.present,
    DateTime(2026, 3, 7): AttendanceStatus.present,
    DateTime(2026, 3, 8): AttendanceStatus.present,
    DateTime(2026, 3, 9): AttendanceStatus.holiday,
    DateTime(2026, 3, 10): AttendanceStatus.present,
    DateTime(2026, 3, 11): AttendanceStatus.present,
    DateTime(2026, 3, 12): AttendanceStatus.absent,
    DateTime(2026, 3, 13): AttendanceStatus.present,
    DateTime(2026, 3, 14): AttendanceStatus.present,
    DateTime(2026, 3, 15): AttendanceStatus.present,
    DateTime(2026, 3, 16): AttendanceStatus.holiday,
    DateTime(2026, 3, 17): AttendanceStatus.present,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screen,
      appBar: CommonAppBar(color: AppColors.darkRed),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text('Attendance', style: AppFonts.poppinsSemiBold5),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AttendanceCard(percentage: 80, present: 78, total: 89),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AttendanceCalendar(attendanceData: data),
            ),

            MonthlyBreakdownCard(),
          ],
        ),
      ),
    );
  }
}
