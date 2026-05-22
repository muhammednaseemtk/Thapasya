import 'package:flutter/foundation.dart';
import 'package:thapasya/features/student/home/model/student_dashboard_model.dart';
import 'package:thapasya/features/student/home/service/student_dashboard_service.dart';

class StudentDashboardController extends ChangeNotifier {
  bool isLoading = false;
  bool isContentLoading = false;
  bool isFetched = false;
  bool fetchAttempted = false;
  String? errorMessage;
  StudentDashboardModel? dashboard;
  int? currentCourseId;
  final service = StudentDashboardService();

  Future<void> fetchIfNeeded(int courseId) async {
    if (courseId <= 0) return;
    if (isLoading ||
        (fetchAttempted && currentCourseId == courseId && isFetched))
      return;

    currentCourseId = courseId;
    fetchAttempted = true;
    await fetchData(courseId);
  }

  Future<void> fetchData(int courseId) async {
    if (courseId <= 0) return;
    if (isLoading) return;

    isLoading = true;
    errorMessage = null;
    dashboard = null;
    notifyListeners();

    try {
      final result = await service.getDashboard(courseId);
      if (result != null) {
        dashboard = result;
        debugPrint(
          "DASHBOARD: loaded courseId=$courseId schedules=${result.schedules.length} logs=${result.recentLogs.length}",
        );
      } else {
        errorMessage = "Failed to load dashboard data";
        debugPrint("DASHBOARD: returned null for courseId=$courseId");
      }
    } catch (e) {
      errorMessage = e.toString();
      debugPrint("FETCH STUDENT DASHBOARD ERROR: $e");
    } finally {
      isLoading = false;
      isFetched = true;
      notifyListeners();
    }
  }

  Future<void> refreshForCourse(int courseId) async {
    if (courseId <= 0 || isContentLoading) return;

    currentCourseId = courseId;
    isContentLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final result = await service.getDashboard(courseId);
      if (result != null) {
        dashboard = result;
      } else {
        errorMessage = "Failed to load dashboard data";
      }
    } catch (e) {
      errorMessage = e.toString();
      debugPrint("REFRESH STUDENT DASHBOARD ERROR: $e");
    } finally {
      isContentLoading = false;
      isFetched = true;
      notifyListeners();
    }
  }

  void resetAll() {
    isLoading = false;
    isContentLoading = false;
    isFetched = false;
    fetchAttempted = false;
    dashboard = null;
    currentCourseId = null;
    errorMessage = null;
    notifyListeners();
  }
}
