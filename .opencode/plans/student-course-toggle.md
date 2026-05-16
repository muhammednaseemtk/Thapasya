# Student Course Toggle Implementation Plan

## Overview
Add three toggle buttons to the student dashboard based on the student course model, with a service and controller using try-catch.

---

## Files to Create

### 1. `lib/features/student/home/service/student_course_service.dart`

```dart
import 'package:thapasya/core/constants/app_urls.dart';
import 'package:thapasya/core/network/dio_client.dart';
import 'package:thapasya/features/student/home/model/student_course_model.dart';

class StudentCourseService {
  Future<List<StudentCourseModel>?> getCourses() async {
    try {
      final response = await DioClient.dio.get(AppUrls.studentCourse);

      if (response.statusCode == 200) {
        final List data = response.data;

        return data.map((e) => StudentCourseModel.fromJson(e)).toList();
      }

      return null;
    } catch (e) {
      return null;
    }
  }
}
```

### 2. `lib/features/student/home/controller/student_course_controller.dart`

```dart
import 'package:flutter/foundation.dart';
import 'package:thapasya/features/student/home/model/student_course_model.dart';
import 'package:thapasya/features/student/home/service/student_course_service.dart';

class StudentCourseController extends ChangeNotifier {
  bool isLoading = false;
  bool isFetched = false;
  String? errorMessage;
  List<StudentCourseModel> courses = [];
  int selectedIndex = 0;
  bool fetchAttempted = false;
  final service = StudentCourseService();

  Future<void> fetchIfNeeded() async {
    if (fetchAttempted || isLoading || isFetched) {
      return;
    }
    fetchAttempted = true;
    await fetchCourses();
  }

  Future<void> fetchCourses() async {
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
      debugPrint("FETCH STUDENT COURSES ERROR : $e");
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
```

---

## Files to Modify

### 3. `lib/features/student/home/widget/student_dashboard_card.dart`

**Changes:**
- Add imports for `common_toggle.dart` and `common_toggle_shimmer.dart`
- Add new parameters: `courseNames`, `selectedCourseIndex`, `isLoading`, `onCourseTap`
- Add `CommonToggle` + `CommonToggleShimmer` after the greeting text

**New full content:**

```dart
import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';
import 'package:thapasya/core/widget/common_toggle.dart';
import 'package:thapasya/core/widget/common_toggle_shimmer.dart';

class StudentDashboardCard extends StatelessWidget {
  final String studentName;
  final String course;
  final String batch;
  final int attendance;
  final String pendingFee;
  final String nextClassTime;
  final List<String> courseNames;
  final int selectedCourseIndex;
  final bool isLoading;
  final Function(int) onCourseTap;

  const StudentDashboardCard({
    super.key,
    required this.studentName,
    required this.course,
    required this.batch,
    required this.attendance,
    required this.pendingFee,
    required this.nextClassTime,
    required this.courseNames,
    required this.selectedCourseIndex,
    required this.isLoading,
    required this.onCourseTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.darkRed,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Good Morning", style: AppFonts.poppinsRegular),

          SizedBox(height: 8),

          Text(studentName, style: AppFonts.poppinsSemiBold4),

          SizedBox(height: 6),

          Text(
            "$course - Level 3 | Batch: $batch",
            style: AppFonts.poppinsSemiBold2,
          ),

          SizedBox(height: 12),

          if (isLoading)
            const CommonToggleShimmer()
          else if (courseNames.isNotEmpty)
            CommonToggle(
              items: courseNames,
              selectedIndex: selectedCourseIndex,
              onTap: onCourseTap,
            ),

          SizedBox(height: 8),
        ],
      ),
    );
  }
}
```

### 4. `lib/features/student/home/view/student_home_screen.dart`

**Changes:**
- Add imports for `provider.dart` and `StudentCourseController`
- Make it a StatefulWidget to call `fetchIfNeeded` on init
- Wrap `StudentDashboardCard` with `Consumer<StudentCourseController>`

**New full content:**

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/routes/app_routes.dart';
import 'package:thapasya/core/widget/common_app_bar.dart';
import 'package:thapasya/features/student/home/controller/student_course_controller.dart';
import 'package:thapasya/features/student/home/widget/class_schedule_card.dart';
import 'package:thapasya/features/student/home/widget/recent_class_logs_card.dart';
import 'package:thapasya/features/student/home/widget/student_dashboard_card.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({super.key});

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<StudentCourseController>().fetchIfNeeded();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screen,
      appBar: CommonAppBar(
        color: AppColors.darkRed,
        onProfileTap: () {
          Navigator.pushNamed(context, AppRoutes.studentProfile);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Column(
            children: [
              Consumer<StudentCourseController>(
                builder: (context, controller, child) {
                  return StudentDashboardCard(
                    studentName: 'Midlaj',
                    course: 'Bharatanatyam',
                    batch: 'Afternoon',
                    attendance: 2,
                    pendingFee: '2000',
                    nextClassTime: '1:00 PM',
                    courseNames: controller.courses.map((e) => e.name).toList(),
                    selectedCourseIndex: controller.selectedIndex,
                    isLoading: controller.isLoading,
                    onCourseTap: controller.selectCourse,
                  );
                },
              ),

              SizedBox(height: 20),

              ClassScheduleCard(),

              SizedBox(height: 20),

              RecentClassLogsCard(),
            ],
          ),
        ),
      ),
    );
  }
}
```

### 5. `lib/main.dart`

**Changes:**
- Add import for `StudentCourseController`
- Add provider in MultiProvider

**Add import:**
```dart
import 'package:thapasya/features/student/home/controller/student_course_controller.dart';
```

**Add to providers list:**
```dart
ChangeNotifierProvider(create: (_) => StudentCourseController()),
```

---

## URL Configuration

The URL is already configured in `lib/core/constants/app_urls.dart`:
```dart
static const String studentCourse = "student/my-courses";
```

Full endpoint: `https://thapasya.duckdns.org/api/v1/student/my-courses`

---

## Summary

| File | Action |
|------|--------|
| `student_course_service.dart` | Create - API service with try-catch |
| `student_course_controller.dart` | Create - State management controller |
| `student_dashboard_card.dart` | Modify - Add CommonToggle parameters |
| `student_home_screen.dart` | Modify - Add Consumer + fetch on init |
| `main.dart` | Modify - Register provider |
