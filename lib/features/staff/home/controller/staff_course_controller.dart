import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_urls.dart';
import 'package:thapasya/features/staff/home/model/staff_course_model.dart';
import 'package:thapasya/features/staff/home/service/staff_course_service.dart';

class StaffCourseController extends ChangeNotifier {
  bool isLoading = false;
  List<StaffCourseModel> courses = [];
  String? errorMessage;

  final StaffCourseService service = StaffCourseService();

  /// 🔥 Student Courses
  Future<void> fetchStudentCourses() async {
    await _fetchCourses(AppUrls.staffCourses);
  }

  /// 🔥 Staff Courses
  Future<void> fetchStaffCourses() async {
    await _fetchCourses(AppUrls.staffCourses);
  }

  /// 🔥 Common method
  Future<void> _fetchCourses(String endpoint) async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      final result = await service.getCourses(endpoint);

      if (result != null) {
        courses = result;
      } else {
        errorMessage = "Failed to load courses";
      }
    } catch (e) {
      errorMessage = "Something went wrong";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}