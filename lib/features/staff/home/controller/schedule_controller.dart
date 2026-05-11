import 'package:flutter/material.dart';
import '../model/schedule_model.dart';
import '../service/schedule_service.dart';

class ScheduleController extends ChangeNotifier {
  bool isLoading = false;
  int selectedIndex = 0;
  int? currentCourseId;
  List<ScheduleModel> schedules = [];
  final ScheduleService service = ScheduleService();

  Future<void> fetchSchedule(int courseId) async {
    if (currentCourseId == courseId && schedules.isNotEmpty) {
      return;
    }
    currentCourseId = courseId;
    isLoading = true;
    schedules = [];
    notifyListeners();
    final result = await service.getSchedule(courseId);
    schedules = result;
    isLoading = false;
    notifyListeners();
  }
}
