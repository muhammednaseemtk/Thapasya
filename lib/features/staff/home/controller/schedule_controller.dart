import 'package:flutter/foundation.dart';
import 'package:thapasya/features/staff/home/model/schedule_model.dart';
import 'package:thapasya/features/staff/home/service/schedule_service.dart';

class ScheduleController extends ChangeNotifier {
  bool isLoading = false;
  int selectedIndex = 0;
  List<ScheduleModel> schedules = [];

  final service = ScheduleService();

  Future<void> fetchSchedule(int index) async {
    selectedIndex = index;
    isLoading = true;
    notifyListeners();

    schedules = await service.getSchedule(index + 1);

    isLoading = false;
    notifyListeners();
  }
}