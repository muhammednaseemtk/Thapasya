import 'package:flutter/foundation.dart';
import 'package:thapasya/features/student/home/model/student_dashboard_model.dart';
import 'package:thapasya/features/student/home/service/student_dashboard_service.dart';

class StudentDashboardController extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;
  StudentDashboardModel? dashboard;
  final service = StudentDashboardService();

  Future<void> fetchData(int courseId) async {
    if (courseId <= 0) return;

    isLoading = true;
    errorMessage = null;
    dashboard = null;
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
      debugPrint("FETCH STUDENT DASHBOARD ERROR: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void resetAll() {
    isLoading = false;
    dashboard = null;
    errorMessage = null;
    notifyListeners();
  }
}