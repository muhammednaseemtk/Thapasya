import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/routes/app_routes.dart';
import 'package:thapasya/core/widget/common_app_bar.dart';
import 'package:thapasya/features/staff/attendance/controller/staff_attendance_controller.dart';
import 'package:thapasya/features/staff/home/controller/schedule_controller.dart';
import 'package:thapasya/features/staff/home/controller/staff_course_controller.dart';
import 'package:thapasya/features/staff/home/widget/staff_dashboard_card.dart';
import 'package:thapasya/features/staff/home/widget/today_scheduled_card.dart';
import 'package:thapasya/features/staff/students/controller/staff_student_controller.dart';

class StaffHomeScreen extends StatelessWidget {
  const StaffHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<StaffCourseController>().fetchIfNeeded().then((_) {
        if (!context.mounted) return;
        final courseController = context.read<StaffCourseController>();
        if (courseController.courses.isNotEmpty) {
          final courseId =
              courseController.courses[courseController.selectedIndex].id;
          context.read<ScheduleController>().fetchIfNeeded(courseId);
          context.read<StaffStudentController>().fetchIfNeeded(
            courseId: courseId,
            branchId: 1,
          );
        }
      });
    });

    return Scaffold(
      backgroundColor: AppColors.screen,

      appBar: CommonAppBar(
        color: AppColors.deepBlue,

        onProfileTap: () {
          Navigator.pushNamed(context, AppRoutes.staffProfile);
        },
      ),

      body: Consumer<StaffCourseController>(
        builder: (context, courseController, _) {
          final courseNames =
              courseController.courses.map((e) => e.name).toList();

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),

              child: Column(
                children: [
                  StaffDashboardCard(
                    name: "Smt. Kavitha Rajan",
                    students: 24,
                    classes: 3,
                    attendance: 82,
                    courseNames: courseNames,
                    selectedCourseIndex: courseController.selectedIndex,
                    isLoading: courseController.isLoading,
                    onCourseTap: (index) async {
                      courseController.selectCourse(index);
                      final courseId = courseController.courses[index].id;
                      if (!context.mounted) return;
                      context.read<StaffAttendanceController>().resetForNewCourse();
                      context.read<StaffStudentController>().fetchStudents(
                        courseId: courseId,
                        branchId: 1,
                      );
                      context.read<ScheduleController>().fetchSchedule(
                        courseId,
                      );
                    },
                  ),

                  const SizedBox(height: 10),

                  const TodayScheduleCard(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
