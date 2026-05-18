import 'package:flutter/foundation.dart';
import 'package:thapasya/features/student/home/model/student_schedule_model.dart';
import 'package:thapasya/features/student/home/service/student_schedule_service.dart';

class StudentScheduleController extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;
  List<StudentScheduleModel> schedules = [];
  final service = StudentScheduleService();

  Future<void> fetchData(int courseId) async {
    if (courseId <= 0) return;

    isLoading = true;
    errorMessage = null;
    schedules = [];
    notifyListeners();

    try {
      schedules = await service.getSchedule(courseId);
    } catch (e) {
      errorMessage = e.toString();
      debugPrint("FETCH STUDENT SCHEDULE ERROR: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void resetAll() {
    isLoading = false;
    schedules = [];
    errorMessage = null;
    notifyListeners();
  }
}