import 'package:flutter/material.dart';
import '../model/attendance_model.dart';
import '../service/attendance_service.dart';

class AttendanceController extends ChangeNotifier {
  final AttendanceService _service = AttendanceService();

  List<int> statusList = [];

  void init(int count) {
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

  Future<bool> submit(List<int> studentIds, int courseId) async {
    try {
      final List<AttendanceRequestModel> list = [];

      for (int i = 0; i < studentIds.length; i++) {
        final status = statusList[i];

        if (status == 0) continue;

        list.add(
          AttendanceRequestModel(
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

      final result = await _service.submitAttendance(list);

      return result;
    } catch (e) {
      print("CONTROLLER ERROR: $e");
      return false;
    }
  }
}