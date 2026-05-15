import 'package:flutter/foundation.dart';
import '../model/past_log_model.dart';
import '../service/past_log_service.dart';

class PastLogController extends ChangeNotifier {
  final service = PastLogService();

  bool isLoading = false;
  bool isFetched = false;
  String? errorMessage;
  List<PastLogModel> logs = [];
  bool _fetchAttempted = false;

  Future<void> fetchIfNeeded() async {
    if (_fetchAttempted || isLoading || isFetched) {
      return;
    }
    _fetchAttempted = true;
    await fetchLogs();
  }

  Future<void> fetchLogs() async {
    if (isLoading) return;
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      logs = await service.getLogs(2);
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
    notifyListeners();
  }
}
