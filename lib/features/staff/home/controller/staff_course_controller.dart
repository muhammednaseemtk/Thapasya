import 'package:flutter/foundation.dart';
import 'package:thapasya/features/staff/home/model/staff_course_model.dart';
import 'package:thapasya/features/staff/home/service/staff_course_service.dart';

class StaffCourseController extends ChangeNotifier {
  bool isLoading = false;
  bool isFetched = false;
  String? errorMessage;
  List<StaffCourseModel> courses = [];
  int selectedIndex = 0;
  bool fetchAttempted = false;
  final service = StaffCourseService();

  Future<void> fetchIfNeeded() async {
    if (fetchAttempted || isLoading || isFetched) {
      return;
    }
    fetchAttempted = true;
    await fetchStaffCourses();
  }

  Future<void> fetchStaffCourses() async {
    if (isLoading) {
      return;
    }
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try {
      final result = await service.getCourses();
      if (result != null) {
        courses = result;
      }
    } catch (e) {
      errorMessage = e.toString();
      debugPrint("FETCH COURSES ERROR : $e");
    } finally {
      isLoading = false;
      isFetched = true;
      notifyListeners();
    }
  }

  void selectCourse(int index) {
    if (selectedIndex == index) {
      return;
    }
    selectedIndex = index;
    notifyListeners();
  }

  void resetAll() {
    isFetched = false;
    fetchAttempted = false;
    courses = [];
    selectedIndex = 0;
    errorMessage = null;
    notifyListeners();
  }
}
