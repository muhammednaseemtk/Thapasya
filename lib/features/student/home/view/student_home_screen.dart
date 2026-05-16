import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/routes/app_routes.dart';
import 'package:thapasya/core/widget/common_app_bar.dart';
import 'package:thapasya/features/student/home/controller/student_class_log_controller.dart';
import 'package:thapasya/features/student/home/controller/student_course_controller.dart';
import 'package:thapasya/features/student/home/controller/student_dashboard_controller.dart';
import 'package:thapasya/features/student/home/controller/student_schedule_controller.dart';
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

  void _onCourseTap(int index) {
    final courseController = context.read<StudentCourseController>();
    courseController.selectCourse(index);

    if (index < courseController.courses.length) {
      final courseId = courseController.courses[index].id;
      context.read<StudentDashboardController>().fetchIfNeeded(courseId);
      context.read<StudentScheduleController>().fetchIfNeeded(courseId);
      context.read<StudentClassLogController>().fetchIfNeeded(courseId);
    }
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
              Consumer2<StudentCourseController, StudentDashboardController>(
                builder: (context, courseCtrl, dashCtrl, child) {
                  final dashboard = dashCtrl.dashboard;
                  return StudentDashboardCard(
                    studentName: dashboard?.studentName ?? 'Student',
                    greeting: dashboard?.greeting ?? 'Good Morning',
                    courseNames: courseCtrl.courses.map((e) => e.name).toList(),
                    selectedCourseIndex: courseCtrl.selectedIndex,
                    isLoading: courseCtrl.isLoading || dashCtrl.isLoading,
                    onCourseTap: _onCourseTap,
                  );
                },
              ),

              SizedBox(height: 20),

              Consumer<StudentScheduleController>(
                builder: (context, scheduleCtrl, child) {
                  return ClassScheduleCard(
                    schedules: scheduleCtrl.schedules,
                    isLoading: scheduleCtrl.isLoading,
                  );
                },
              ),

              SizedBox(height: 20),

              Consumer<StudentClassLogController>(
                builder: (context, logCtrl, child) {
                  return RecentClassLogsCard(
                    logs: logCtrl.logs,
                    isLoading: logCtrl.isLoading,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
