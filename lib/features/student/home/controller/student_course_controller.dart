import 'package:flutter/foundation.dart';
import 'package:thapasya/features/student/home/model/student_course_model.dart';
import 'package:thapasya/features/student/home/service/student_course_service.dart';

class StudentCourseController extends ChangeNotifier {
  bool isLoading = false;
  bool isFetched = false;
  bool fetchAttempted = false;
  String? errorMessage;
  List<StudentCourseModel> courses = [];
  int selectedIndex = 0;

  final StudentCourseService service = StudentCourseService();
  List<String> get courseNames => courses.map((course) => course.name).toList();

  Future<void> fetchIfNeeded() async {
    if (isLoading || fetchAttempted) return;

    fetchAttempted = true;
    await fetchCourses();
  }

  Future<void> fetchCourses() async {
    if (isLoading) return;

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

      debugPrint("FETCH STUDENT COURSES ERROR: $e");

      if (errorMessage?.contains('401') == true ||
          errorMessage?.contains('Unauthorized') == true) {
        errorMessage = 'Session expired. Please login again.';
      }
    } finally {
      isLoading = false;
      isFetched = true;
      notifyListeners();
    }
  }

  void selectCourse(int index) {
    if (selectedIndex == index || courses.isEmpty) return;

    if (index < 0 || index >= courses.length) return;

    selectedIndex = index;
    notifyListeners();
  }

  int get selectedCourseId {
    if (courses.isEmpty || selectedIndex >= courses.length) {
      return 0;
    }

    return courses[selectedIndex].id;
  }

  void resetAll() {
    isLoading = false;
    isFetched = false;
    fetchAttempted = false;
    courses = [];
    selectedIndex = 0;
    errorMessage = null;

    notifyListeners();
  }
}
