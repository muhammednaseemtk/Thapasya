import 'package:flutter/material.dart';
import '../model/daily_log_request_model.dart';
import '../model/past_log_model.dart';
import '../service/daily_log_service.dart';

class DailyLogController extends ChangeNotifier {
  final DailyLogService service = DailyLogService();
  final TextEditingController classSummaryController = TextEditingController();
  final TextEditingController topicsCoveredController = TextEditingController();
  final TextEditingController nextClassTopicController =
      TextEditingController();
  bool isLoading = false;

  bool isTodayLogSubmitted(List<PastLogModel> logs) {
    final today = DateTime.now();
    final todayStr =
        "${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";
    return logs.any((log) => log.date == todayStr);
  }

  Future<String> submitLog(int courseId) async {
    if (isLoading) {
      return "Please wait...";
    }
    isLoading = true;
    notifyListeners();

    try {
      final model = DailyLogRequestModel(
        courseId: courseId,
        classSummary: classSummaryController.text.trim(),
        topicsCovered: topicsCoveredController.text.trim(),
        nextClassTopic: nextClassTopicController.text.trim(),
      );
      final result = await service.submitLog(model);

      return result;
    } catch (e) {
      print("CONTROLLER ERROR : $e");
      return "Something went wrong";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
  @override
  void dispose() {
    classSummaryController.dispose();
    topicsCoveredController.dispose();
    nextClassTopicController.dispose();
    super.dispose();
  }
}
