import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/routes/app_routes.dart';
import 'package:thapasya/core/widget/common_app_bar.dart';
import 'package:thapasya/features/student/home/controller/student_course_controller.dart';
import 'package:thapasya/features/student/home/controller/student_dashboard_controller.dart';
import 'package:thapasya/features/student/home/widget/class_schedule_card.dart';
import 'package:thapasya/features/student/home/widget/recent_class_logs_card.dart';
import 'package:thapasya/features/student/home/widget/student_dashboard_card.dart';

class StudentHomeScreen extends StatelessWidget {
  const StudentHomeScreen({super.key});

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
      body: Consumer2<StudentCourseController, StudentDashboardController>(
        builder: (context, courseCtrl, dashCtrl, _) {
          if (!courseCtrl.fetchAttempted) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              courseCtrl.fetchIfNeeded().then((_) {
                if (!context.mounted) return;
                if (courseCtrl.courses.isNotEmpty) {
                  final courseId =
                      courseCtrl.courses[courseCtrl.selectedIndex].id;
                  dashCtrl.fetchIfNeeded(courseId);
                }
              });
            });
          }

          final courseNames = courseCtrl.courses.map((e) => e.name).toList();
          final schedules = dashCtrl.dashboard?.schedules ?? [];
          final recentLogs = dashCtrl.dashboard?.recentLogs ?? [];
          final contentLoading =
              dashCtrl.isLoading || dashCtrl.isContentLoading;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Column(
                children: [
                  StudentDashboardCard(
                    studentName: dashCtrl.dashboard?.studentName ?? 'Student',
                    greeting: dashCtrl.dashboard?.greeting ?? 'Good Morning',
                    courseNames: courseNames,
                    selectedCourseIndex: courseCtrl.selectedIndex,
                    isLoading: courseCtrl.isLoading || dashCtrl.isLoading,
                    onCourseTap: (index) {
                      final courseId = courseCtrl.courses[index].id;
                      debugPrint(
                        "STUDENT_HOME: onCourseTap index=$index courseId=$courseId",
                      );
                      courseCtrl.selectCourse(index);
                      dashCtrl.refreshForCourse(courseId);
                    },
                  ),
                  if (dashCtrl.errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        dashCtrl.errorMessage!,
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ),
                  const SizedBox(height: 20),
                  ClassScheduleCard(
                    schedules: schedules,
                    isLoading: contentLoading,
                  ),
                  const SizedBox(height: 20),
                  RecentClassLogsCard(
                    logs: recentLogs,
                    isLoading: contentLoading,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
