import 'package:flutter/foundation.dart';
import 'package:thapasya/features/staff/students/model/staff_student_model.dart';
import 'package:thapasya/features/staff/students/service/staff_student_service.dart';

class StaffStudentController extends ChangeNotifier {
  bool isLoading = false;
  bool isFetched = false;
  List<StaffStudentModel> students = [];
  String? errorMessage;
  int? currentCourseId;
  bool _fetchAttempted = false;
  final StaffStudentService service = StaffStudentService();

  Future<void> fetchIfNeeded({
    required int courseId,
    required int branchId,
  }) async {
    if (_fetchAttempted || (currentCourseId == courseId && isFetched)) {
      return;
    }
    _fetchAttempted = true;
    await fetchStudents(courseId: courseId, branchId: branchId);
  }

  Future<void> fetchStudents({
    required int courseId,
    required int branchId,
  }) async {
    if (currentCourseId == courseId && students.isNotEmpty) {
      return;
    }
    currentCourseId = courseId;
    isLoading = true;
    isFetched = false;
    errorMessage = null;
    students = [];
    notifyListeners();

    try {
      final result = await service.getStudents(
        courseId: courseId,
        branchId: branchId,
      );
      students = result;
      isFetched = true;
    } catch (e) {
      errorMessage = e.toString();
      isFetched = false;
      debugPrint("FETCH STUDENTS ERROR : $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void resetFetch() {
    isFetched = false;
    _fetchAttempted = false;
    currentCourseId = null;
    students = [];
    errorMessage = null;
    notifyListeners();
  }
}
