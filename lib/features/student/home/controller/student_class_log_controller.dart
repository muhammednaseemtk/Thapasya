import 'package:flutter/foundation.dart';
import 'package:thapasya/features/student/home/model/student_class_log_model.dart';
import 'package:thapasya/features/student/home/service/student_class_log_service.dart';

class StudentClassLogController extends ChangeNotifier {
  bool isLoading = false;
  bool isFetched = false;
  String? errorMessage;
  int? currentCourseId;
  List<StudentClassLogModel> logs = [];
  bool fetchAttempted = false;
  final service = StudentClassLogService();

  Future<void> fetchIfNeeded(int courseId) async {
    if (fetchAttempted || (currentCourseId == courseId && isFetched)) {
      return;
    }
    fetchAttempted = true;
    await fetchLogs(courseId);
  }

  Future<void> fetchLogs(int courseId) async {
    if (currentCourseId == courseId && logs.isNotEmpty) {
      return;
    }
    currentCourseId = courseId;
    isLoading = true;
    errorMessage = null;
    logs = [];
    notifyListeners();
    try {
      logs = await service.getClassLogs(courseId);
    } catch (e) {
      errorMessage = e.toString();
      debugPrint("FETCH STUDENT CLASS LOGS ERROR : $e");
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
    logs = [];
    errorMessage = null;
    notifyListeners();
  }
}
