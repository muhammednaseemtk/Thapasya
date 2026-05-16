import 'package:flutter/foundation.dart';
import '../model/past_log_model.dart';
import '../service/past_log_service.dart';

class PastLogController extends ChangeNotifier {
  final service = PastLogService();

  bool isLoading = false;
  bool isFetched = false;
  String? errorMessage;
  List<PastLogModel> logs = [];
  bool showAllLogs = false;
  bool isExpanding = false;
  int? currentCourseId;
  bool _fetchAttempted = false;

  Future<void> toggleShowAll() async {
    isExpanding = true;
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 800));
    showAllLogs = true;
    isExpanding = false;
    notifyListeners();
  }

  Future<void> fetchIfNeeded(int courseId) async {
    if (currentCourseId == courseId && (_fetchAttempted || isLoading || isFetched)) {
      return;
    }
    currentCourseId = courseId;
    _fetchAttempted = true;
    await fetchLogs(courseId);
  }

  Future<void> fetchLogs(int courseId) async {
    if (isLoading) return;
    isLoading = true;
    errorMessage = null;
    showAllLogs = false;
    currentCourseId = courseId;
    notifyListeners();

    try {
      logs = await service.getLogs(2, courseId);
      isFetched = true;
    } catch (e) {
      errorMessage = e.toString();
      isFetched = false;
      debugPrint("FETCH LOG ERROR : $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void resetFetch() {
    isFetched = false;
    _fetchAttempted = false;
    logs = [];
    errorMessage = null;
    showAllLogs = false;
    isExpanding = false;
    currentCourseId = null;
    notifyListeners();
  }
}
