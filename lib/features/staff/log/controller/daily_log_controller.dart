import 'package:flutter/material.dart';
import '../model/daily_log_request_model.dart';
import '../service/daily_log_service.dart';

class DailyLogController extends ChangeNotifier {
  final DailyLogService service = DailyLogService();
  final TextEditingController classSummaryController = TextEditingController();
  final TextEditingController topicsCoveredController = TextEditingController();
  final TextEditingController nextClassTopicController =
      TextEditingController();

  bool isLoading = false;

  Future<String> submitLog() async {
    if (classSummaryController.text.trim().isEmpty ||
        topicsCoveredController.text.trim().isEmpty ||
        nextClassTopicController.text.trim().isEmpty) {
      return "Please fill all fields";
    }

    isLoading = true;
    notifyListeners();

    final DailyLogRequestModel model = DailyLogRequestModel(
      courseId: 2,
      classSummary: classSummaryController.text.trim(),
      topicsCovered: topicsCoveredController.text.trim(),
      nextClassTopic: nextClassTopicController.text.trim(),
    );

    final result = await service.submitLog(model);

    isLoading = false;
    notifyListeners();

    if (result == "success") {
      classSummaryController.clear();
      topicsCoveredController.clear();
      nextClassTopicController.clear();
    }

    return result;
  }
}
