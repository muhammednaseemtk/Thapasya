import 'package:flutter/foundation.dart';
import 'package:thapasya/features/student/home/model/student_course_model.dart';
import 'package:thapasya/features/student/home/service/student_course_service.dart';

class StudentCourseController extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  List<StudentCourseModel> _courses = [];
  int _selectedIndex = 0;
  final _service = StudentCourseService();

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  List<StudentCourseModel> get courses => _courses;
  List<String> get courseNames => _courses.map((e) => e.name).toList();
  int get selectedIndex => _selectedIndex;

  Future<void> fetchCourses() async {
    if (_isLoading) return;

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final result = await _service.getCourses();
      _courses = result ?? [];
    } catch (e) {
      _errorMessage = e.toString();
      debugPrint("FETCH STUDENT COURSES ERROR: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void selectCourse(int index) {
    if (_selectedIndex == index || _courses.isEmpty) return;
    if (index < 0 || index >= _courses.length) return;
    _selectedIndex = index;
    notifyListeners();
  }

  int get selectedCourseId {
    if (_courses.isEmpty || _selectedIndex >= _courses.length) return 0;
    return _courses[_selectedIndex].id;
  }

  void resetAll() {
    _isLoading = false;
    _courses = [];
    _selectedIndex = 0;
    _errorMessage = null;
    notifyListeners();
  }
}