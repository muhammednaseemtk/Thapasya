import 'package:flutter/material.dart';
import 'package:thapasya/features/staff/students/model/staff_student_model.dart';
import 'package:thapasya/features/staff/students/service/staff_student_service.dart';

class StaffStudentController extends ChangeNotifier {
  bool isLoading = false;

  List<StaffStudentModel> students = [];

  final service = StaffStudentService();

  Future<void> fetchStudents(int courseId) async {
    isLoading = true;
    notifyListeners();

    final result = await service.getStudents(
      courseId: courseId,
      branchId: 1, 
    );

    if (result != null) {
      students = result;
    }

    isLoading = false;
    notifyListeners();
  }
}