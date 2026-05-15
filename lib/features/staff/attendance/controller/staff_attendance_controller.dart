import 'package:flutter/foundation.dart';
import '../model/staff_attendance_model.dart';
import '../service/staff_attendance_service.dart';

class StaffAttendanceController extends ChangeNotifier {
  final StaffAttendanceService service = StaffAttendanceService();

  List<int> statusList = [];
  bool isSubmitting = false;
  bool isSubmitted = false;
  bool isInitialized = false;
  String? errorMessage;

  void initIfNeeded(int count) {
    if (isInitialized || statusList.length == count) {
      return;
    }
    statusList = List.filled(count, 0);
    isInitialized = true;
    notifyListeners();
  }

  void resetForNewCourse() {
    isInitialized = false;
    isSubmitted = false;
    statusList = [];
    notifyListeners();
  }

  void setStatus(int index, int value) {
    if (isSubmitted) {
      return;
    }

    if (index >= 0 && index < statusList.length) {
      statusList[index] = value;
      notifyListeners();
    }
  }

  int get presentCount => statusList.where((e) => e == 1).length;
  int get absentCount => statusList.where((e) => e == 2).length;
  int get lateCount => statusList.where((e) => e == 3).length;

  Future<String> submit({
    required List<int> studentIds,
    required int courseId,
  }) async {
    if (studentIds.isEmpty) {
      return "No students to mark attendance";
    }
    try {
      isSubmitting = true;
      errorMessage = null;
      notifyListeners();
      final List<StaffAttendanceRequestModel> data = [];
      for (int i = 0; i < studentIds.length; i++) {
        if (i >= statusList.length) break;
        final status = statusList[i];
        if (status == 0) {
          continue;
        }

        data.add(
          StaffAttendanceRequestModel(
            studentId: studentIds[i],
            courseId: courseId,
            status: status == 1
                ? "present"
                : status == 2
                ? "absent"
                : "late",
          ),
        );
      }

      if (data.isEmpty) {
        isSubmitting = false;
        notifyListeners();
        return "Please mark attendance";
      }

      final result = await service.submitAttendance(data);
      isSubmitting = false;
      if (result == "success") {
        isSubmitted = true;
        statusList = List.filled(statusList.length, 0);
      }
      notifyListeners();
      return result;
    } catch (e) {
      isSubmitting = false;
      errorMessage = e.toString();
      notifyListeners();
      return "Something went wrong";
    }
  }

  void resetAttendance() {
    isSubmitted = false;
    isInitialized = false;
    statusList = [];
    notifyListeners();
  }
}
