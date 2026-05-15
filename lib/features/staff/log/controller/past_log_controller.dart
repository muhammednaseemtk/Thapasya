import 'package:flutter/material.dart';
import '../model/past_log_model.dart';
import '../service/past_log_service.dart';

class PastLogController
    extends ChangeNotifier {
  final service = PastLogService();

  bool isLoading = false;
  bool isFetched = false;
  List<PastLogModel> logs = [];

  Future<void> fetchLogs() async {
    if (isLoading) return;
    isLoading = true;
    notifyListeners();

    try {
      logs = await service.getLogs(2);
      isFetched = true;
    } catch (e) {
      print("FETCH LOG ERROR : $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}