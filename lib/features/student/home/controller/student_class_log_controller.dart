import 'package:flutter/foundation.dart';
import 'package:thapasya/features/student/home/model/student_class_log_model.dart';
import 'package:thapasya/features/student/home/service/student_class_log_service.dart';

class StudentClassLogController extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;
  List<StudentClassLogModel> logs = [];
  final service = StudentClassLogService();

  Future<void> fetchData(int courseId) async {
    if (courseId <= 0) return;

    isLoading = true;
    errorMessage = null;
    logs = [];
    notifyListeners();

    try {
      logs = await service.getClassLogs(courseId);
    } catch (e) {
      errorMessage = e.toString();
      debugPrint("FETCH STUDENT CLASS LOGS ERROR: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void resetAll() {
    isLoading = false;
    logs = [];
    errorMessage = null;
    notifyListeners();
  }
}