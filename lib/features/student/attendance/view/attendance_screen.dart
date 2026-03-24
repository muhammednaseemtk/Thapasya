import 'package:Thapasya/features/student/attendance/model/attendance_status.dart';
import 'package:Thapasya/features/student/attendance/widget/attendance_calender.dart';
import 'package:Thapasya/features/student/attendance/widget/attendance_card.dart';
import 'package:Thapasya/features/student/attendance/widget/attendance_legend.dart';
import 'package:Thapasya/features/student/attendance/widget/monthly_break_down_card.dart';
import 'package:Thapasya/features/student/home/widget/common_app_bar.dart';
import 'package:flutter/material.dart';

class AttendanceScreen extends StatelessWidget {
   AttendanceScreen({super.key});

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CommonAppBar(),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text('Attendance',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ,),
            ),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AttendanceCard(percentage: 80, present: 78, total: 89),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AttendanceCalendar(attendanceData: data),
            ),

            MonthlyBreakdownCard()
          ],
        ),
      ),
    );
  }
}
