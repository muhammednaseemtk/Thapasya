import 'package:flutter/material.dart';

class AttendanceController extends ChangeNotifier {
  List<int> statusList = [];

  void init(int count) {
    statusList = List.filled(count, 0);
    notifyListeners();
  }

  void setStatus(int index, int value) {
    statusList[index] = value;
    notifyListeners();
  }

  int get presentCount => statusList.where((e) => e == 1).length;

  int get absentCount => statusList.where((e) => e == 2).length;

  int get lateCount => statusList.where((e) => e == 3).length;
}
