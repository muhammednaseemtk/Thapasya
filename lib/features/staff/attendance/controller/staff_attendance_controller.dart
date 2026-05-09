import 'package:flutter/material.dart';
import '../model/staff_attendance_model.dart';
import '../service/staff_attendance_service.dart';

class StafffAttendanceController extends ChangeNotifier {
  final StaffAttendanceService service = StaffAttendanceService();

  List<int> statusList = [];

  bool isSubmitting = false;

  void init(int count) {
    if (statusList.length == count) return;

    statusList = List.filled(count, 0);
    notifyListeners();
  }

  void setStatus(int index, int value) {
    statusList[index] = value;
    notifyListeners();
  }

  int get presentCount => statusList.where((e) => e == 1).length;

  int get absentCount => statusList.where((e) => e == 2).length;

  int get lateCount => statusList.where((e) => e == 3).length;

  Future<bool> submit({
    required List<int> studentIds,
    required int courseId,
  }) async {
    try {
      isSubmitting = true;
      notifyListeners();

      final List<StaffAttendanceRequestModel> data = [];

      for (int i = 0; i < studentIds.length; i++) {
        final status = statusList[i];

        if (status == 0) continue;

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

      final result = await service.submitAttendance(data);

      isSubmitting = false;
      notifyListeners();

      return result;
    } catch (e) {
      isSubmitting = false;
      notifyListeners();

      print("ATTENDANCE CONTROLLER ERROR: $e");

      return false;
    }
  }
}
