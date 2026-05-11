import 'package:flutter/material.dart';
import 'package:thapasya/features/staff/students/model/staff_student_model.dart';
import 'package:thapasya/features/staff/students/service/staff_student_service.dart';

class StaffStudentController extends ChangeNotifier {
  bool isLoading = false;
  bool isFetched = false;
  List<StaffStudentModel> students = [];
  final StaffStudentService service = StaffStudentService();

  Future<void> fetchStudents(int courseId) async {
    isLoading = true;
    isFetched = true;
    students = [];
    notifyListeners();
    final result = await service.getStudents(courseId: courseId, branchId: 1);
    students = result;
    isLoading = false;
    notifyListeners();
  }

  void resetFetch() {
    isFetched = false;
    students = [];
    notifyListeners();
  }
}
