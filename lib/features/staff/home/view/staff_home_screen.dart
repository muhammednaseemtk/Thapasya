import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/routes/app_routes.dart';
import 'package:thapasya/core/widget/common_app_bar.dart';
import 'package:thapasya/features/staff/home/controller/schedule_controller.dart';
import 'package:thapasya/features/staff/home/controller/staff_course_controller.dart';
import 'package:thapasya/features/staff/home/widget/staff_dashboard_card.dart';
import 'package:thapasya/features/staff/home/widget/today_scheduled_card.dart';
import 'package:thapasya/features/staff/students/controller/staff_student_controller.dart';

class StaffHomeScreen extends StatelessWidget {
  const StaffHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final horizontalPadding = screenWidth * 0.025;
    final verticalPadding = screenWidth * 0.02;

    return Scaffold(
      backgroundColor: AppColors.screen,

      appBar: CommonAppBar(
        color: AppColors.deepBlue,

        onProfileTap: () {
          Navigator.pushNamed(context, AppRoutes.staffProfile);
        },
      ),

      body:
          Consumer3<
            StaffCourseController,
            ScheduleController,
            StaffStudentController
          >(
            builder:
                (
                  context,
                  courseController,
                  scheduleController,
                  studentController,
                  _,
                ) {
                  WidgetsBinding.instance.addPostFrameCallback((_) async {
                    if (courseController.courses.isEmpty &&
                        !courseController.isLoading) {
                      await courseController.fetchStaffCourses();
                      if (courseController.courses.isNotEmpty) {
                        final courseId = courseController
                            .courses[courseController.selectedIndex]
                            .id;
                        await scheduleController.fetchSchedule(courseId);
                        await studentController.fetchStudents(courseId);
                      }
                    }
                  });

                  return SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                        vertical: verticalPadding,
                      ),

                      child: const Column(
                        children: [
                          StaffDashboardCard(
                            name: "Smt. Kavitha Rajan",
                            students: 24,
                            classes: 3,
                            attendance: 82,
                          ),

                          SizedBox(height: 10),

                          TodayScheduleCard(),
                        ],
                      ),
                    ),
                  );
                },
          ),
    );
  }
}
