import 'package:flutter/foundation.dart';
import 'package:thapasya/features/student/home/model/student_schedule_model.dart';
import 'package:thapasya/features/student/home/service/student_schedule_service.dart';

class StudentScheduleController extends ChangeNotifier {
  bool isLoading = false;
  bool isFetched = false;
  String? errorMessage;
  int? currentCourseId;
  List<StudentScheduleModel> schedules = [];
  bool fetchAttempted = false;
  final service = StudentScheduleService();

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
      schedules = await service.getSchedule(courseId);
    } catch (e) {
      errorMessage = e.toString();
      debugPrint("FETCH STUDENT SCHEDULE ERROR : $e");
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
