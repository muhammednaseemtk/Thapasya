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
}