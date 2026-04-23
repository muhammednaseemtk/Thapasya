import 'package:flutter/material.dart';
import 'package:thapasya/features/staff/home/model/staff_course_model.dart';
import 'package:thapasya/features/staff/home/service/staff_course_service.dart';

class StaffCourseController extends ChangeNotifier {
  bool isLoading = false;
  List<StaffCourseModel> courses = [];
  int selectedIndex = 0;

  final service = StaffCourseService();

  Future<void> fetchStaffCourses() async {
    isLoading = true;
    notifyListeners();

    final result = await service.getCourses();

    if (result != null) {
      courses = result;
    }

    isLoading = false;
    notifyListeners();
  }

  void selectCourse(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}