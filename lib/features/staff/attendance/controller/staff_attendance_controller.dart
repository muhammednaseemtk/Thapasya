import 'package:flutter/material.dart';
import '../model/staff_attendance_model.dart';
import '../service/staff_attendance_service.dart';

class StafffAttendanceController extends ChangeNotifier {
  final StaffAttendanceService service = StaffAttendanceService();

  List<int> statusList = [];
  bool isSubmitting = false;
  bool isSubmitted = false;

  void init(int count) {
    if (statusList.length == count) {
      return;
    }

    statusList = List.filled(count, 0);
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
      notifyListeners();
      final List<StaffAttendanceRequestModel> data = [];
      for (int i = 0; i < studentIds.length; i++) {
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
      }
      notifyListeners();
      return result;
    } catch (e) {
      isSubmitting = false;
      notifyListeners();
      return "Something went wrong";
    }
  }

  void resetAttendance() {
    isSubmitted = false;
    statusList = List.filled(statusList.length, 0);
    notifyListeners();
  }
}
