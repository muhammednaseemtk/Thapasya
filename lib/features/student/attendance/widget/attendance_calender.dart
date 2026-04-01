import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:thapasya/features/student/attendance/model/attendance_status.dart';
import 'package:thapasya/features/student/attendance/widget/attendance_legend.dart';

class AttendanceCalendar extends StatelessWidget {
  final Map<DateTime, AttendanceStatus> attendanceData;

  const AttendanceCalendar({super.key, required this.attendanceData});

  Color getColor(AttendanceStatus status) {
    switch (status) {
      case AttendanceStatus.present:
        return Colors.green;
      case AttendanceStatus.absent:
        return Colors.red;
      case AttendanceStatus.holiday:
        return Colors.orange;
      default:
        return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: DateTime.now(),
            calendarStyle: CalendarStyle(outsideDaysVisible: false),

            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) {
                final status =
                    attendanceData[DateTime(day.year, day.month, day.day)];

                if (status == null || status == AttendanceStatus.none) {
                  return Center(child: Text('${day.day}'));
                }

                return Center(
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: getColor(status).withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${day.day}',
                        style: TextStyle(color: getColor(status)),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          AttendanceLegend(),

          SizedBox(height: 15),
        ],
      ),
    );
  }
}
