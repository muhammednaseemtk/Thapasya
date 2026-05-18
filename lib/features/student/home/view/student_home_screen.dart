import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/widget/common_app_bar.dart';
import 'package:thapasya/features/student/home/controller/student_class_log_controller.dart';
import 'package:thapasya/features/student/home/controller/student_course_controller.dart';
import 'package:thapasya/features/student/home/controller/student_dashboard_controller.dart';
import 'package:thapasya/features/student/home/controller/student_schedule_controller.dart';
import 'package:thapasya/features/student/home/widget/class_schedule_card.dart';
import 'package:thapasya/features/student/home/widget/recent_class_logs_card.dart';
import 'package:thapasya/features/student/home/widget/student_dashboard_card.dart';

class StudentHomeScreen extends StatelessWidget {
  const StudentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screen,
      appBar: const CommonAppBar(
        color: AppColors.darkRed,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Column(
            children: [
              Consumer<StudentCourseController>(
                builder: (context, courseCtrl, _) {
                  return Consumer<StudentDashboardController>(
                    builder: (context, dashCtrl, _) {
                      return Column(
                        children: [
                          StudentDashboardCard(
                            studentName: dashCtrl.dashboard?.studentName ?? 'Student',
                            greeting: dashCtrl.dashboard?.greeting ?? 'Good Morning',
                            courseNames: courseCtrl.courseNames,
                            selectedCourseIndex: courseCtrl.selectedIndex,
                            isLoading: courseCtrl.isLoading || dashCtrl.isLoading,
                            onCourseTap: (index) {
                              courseCtrl.selectCourse(index);
                              final courseId = courseCtrl.selectedCourseId;
                              if (courseId > 0) {
                                context.read<StudentDashboardController>().fetchData(courseId);
                                context.read<StudentScheduleController>().fetchData(courseId);
                                context.read<StudentClassLogController>().fetchData(courseId);
                              }
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
                        ],
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              Consumer<StudentScheduleController>(
                builder: (context, schedCtrl, _) {
                  return Column(
                    children: [
                      ClassScheduleCard(
                        schedules: schedCtrl.schedules,
                        isLoading: schedCtrl.isLoading,
                      ),
                      if (schedCtrl.errorMessage != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            schedCtrl.errorMessage!,
                            style: const TextStyle(color: Colors.red, fontSize: 12),
                          ),
                        ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 20),
              Consumer<StudentClassLogController>(
                builder: (context, logCtrl, _) {
                  return Column(
                    children: [
                      RecentClassLogsCard(
                        logs: logCtrl.logs,
                        isLoading: logCtrl.isLoading,
                      ),
                      if (logCtrl.errorMessage != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            logCtrl.errorMessage!,
                            style: const TextStyle(color: Colors.red, fontSize: 12),
                          ),
                        ),
                    ],
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