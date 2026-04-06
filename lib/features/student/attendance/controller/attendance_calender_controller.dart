import 'package:flutter/material.dart';

class AttendanceCalendarController extends ChangeNotifier {
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;

  void onDaySelected(DateTime selected, DateTime focused) {
    selectedDay = selected;
    focusedDay = focused;
    notifyListeners(); 
  }

  DateTime normalize(DateTime d) => DateTime(d.year, d.month, d.day);
}