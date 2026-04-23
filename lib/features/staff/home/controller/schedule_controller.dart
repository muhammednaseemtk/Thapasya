import 'package:flutter/material.dart';
import '../model/schedule_model.dart';
import '../service/schedule_service.dart';

class ScheduleController extends ChangeNotifier {
  bool isLoading = false;
  int selectedIndex = 0;
  List<ScheduleModel> schedules = [];

  final service = ScheduleService();

  int getCourseId(int index) {
    return index + 1;
  }

  Future<void> fetchSchedule(int index) async {
    selectedIndex = index;
    isLoading = true;
    notifyListeners();

    final courseId = getCourseId(index);
    final result = await service.getSchedule(courseId);

    if (result != null) {
      schedules = result;
    }

    isLoading = false;
    notifyListeners();
  }
}