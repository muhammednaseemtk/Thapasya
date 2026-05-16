import 'package:flutter/foundation.dart';
import 'package:thapasya/features/student/home/model/student_dashboard_model.dart';
import 'package:thapasya/features/student/home/service/student_dashboard_service.dart';

class StudentDashboardController extends ChangeNotifier {
  bool isLoading = false;
  bool isFetched = false;
  String? errorMessage;
  StudentDashboardModel? dashboard;
  int? currentCourseId;
  bool fetchAttempted = false;
  final service = StudentDashboardService();

  Future<void> fetchIfNeeded(int courseId) async {
    if (fetchAttempted || (currentCourseId == courseId && isFetched)) {
      return;
    }
    fetchAttempted = true;
    await fetchDashboard(courseId);
  }

  Future<void> fetchDashboard(int courseId) async {
    if (currentCourseId == courseId && dashboard != null) {
      return;
    }
    currentCourseId = courseId;
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try {
      final result = await service.getDashboard(courseId);
      if (result != null) {
        dashboard = result;
      }
    } catch (e) {
      errorMessage = e.toString();
      debugPrint("FETCH STUDENT DASHBOARD ERROR : $e");
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
    dashboard = null;
    errorMessage = null;
    notifyListeners();
  }
}
