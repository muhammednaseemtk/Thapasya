import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/features/student/attendance/controller/attendance_calender_controller.dart';
import 'package:thapasya/features/student/attendance/model/attendance_status.dart';
import 'package:thapasya/features/student/attendance/widget/attendance_legend.dart';

class AttendanceCalendar extends StatelessWidget {
  final Map<DateTime, AttendanceStatus> attendanceData;

  const AttendanceCalendar({
    super.key,
    required this.attendanceData,
  });

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
    return Consumer<AttendanceCalendarController>(
      builder: (context, controller, child) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: controller.focusedDay,

                selectedDayPredicate: (day) {
                  return isSameDay(controller.selectedDay, day);
                },

                onDaySelected: controller.onDaySelected,

                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),

                calendarStyle: const CalendarStyle(
                  outsideDaysVisible: false,
                ),

                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, day, focusedDay) {
                    final normalizedDay = controller.normalize(day);
                    final status = attendanceData[normalizedDay];

                    if (status == null ||
                        status == AttendanceStatus.none) {
                      return Center(
                        child: Text(
                          '${day.day}',
                          style: const TextStyle(color: Colors.black),
                        ),
                      );
                    }

                    return Center(
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: getColor(status),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '${day.day}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    );
                  },

                  todayBuilder: (context, day, focusedDay) {
                    return Container(
                      margin: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.blue, width: 1.5),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '${day.day}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  },

                  selectedBuilder: (context, day, focusedDay) {
                    return Container(
                      margin: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '${day.day}',
                          style:
                              const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 10),
              const AttendanceLegend(),
              const SizedBox(height: 15),
            ],
          ),
        );
      },
    );
  }
}