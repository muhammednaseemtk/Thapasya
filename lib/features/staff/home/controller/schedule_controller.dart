import 'package:flutter/foundation.dart';
import '../model/schedule_model.dart';
import '../service/schedule_service.dart';

class ScheduleController extends ChangeNotifier {
  bool isLoading = false;
  bool isFetched = false;
  String? errorMessage;
  int selectedIndex = 0;
  int? currentCourseId;
  List<ScheduleModel> schedules = [];
  bool fetchAttempted = false;
  final ScheduleService service = ScheduleService();

  Future<void> fetchIfNeeded(int courseId) async {
    if (fetchAttempted || (currentCourseId == courseId && isFetched)) {
      return;
    }
    fetchAttempted = true;
    await fetchSchedule(courseId);
  }

  Future<void> fetchSchedule(int courseId) async {
    if (currentCourseId == courseId && schedules.isNotEmpty) {
      return;
    }
    currentCourseId = courseId;
    isLoading = true;
    errorMessage = null;
    schedules = [];
    notifyListeners();

    try {
      final result = await service.getSchedule(courseId);
      schedules = result;
    } catch (e) {
      errorMessage = e.toString();
      debugPrint("FETCH SCHEDULE ERROR : $e");
    } finally {
      isLoading = false;
      isFetched = true;
      notifyListeners();
    }
  }

  void resetAll() {
    isFetched = false;
    fetchAttempted = false;
    currentCourseId = null;
    schedules = [];
    errorMessage = null;
    notifyListeners();
  }
}
