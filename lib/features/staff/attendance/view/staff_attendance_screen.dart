import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/routes/app_routes.dart';
import 'package:thapasya/core/widget/common_app_bar.dart';
import 'package:thapasya/core/widget/common_button.dart';
import 'package:thapasya/features/staff/attendance/controller/staff_attendance_controller.dart';
import 'package:thapasya/features/staff/attendance/widget/attendance_header.dart';
import 'package:thapasya/features/staff/attendance/widget/attendance_result_dialog.dart';
import 'package:thapasya/features/staff/attendance/widget/attendance_shimmer.dart';
import 'package:thapasya/features/staff/attendance/widget/attendance_student_list.dart';
import 'package:thapasya/features/staff/attendance/widget/attendance_summary.dart';
import 'package:thapasya/features/staff/home/controller/staff_course_controller.dart';
import 'package:thapasya/features/staff/students/controller/staff_student_controller.dart';

class StaffAttendanceScreen extends StatelessWidget {
  const StaffAttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final courseController = context.read<StaffCourseController>();
      if (courseController.courses.isNotEmpty) {
        final courseId =
            courseController.courses[courseController.selectedIndex].id;
        context.read<StaffStudentController>().fetchIfNeeded(
          courseId: courseId,
          branchId: 1,
        );
      }

      final studentController = context.read<StaffStudentController>();
      if (studentController.students.isNotEmpty) {
        context.read<StaffAttendanceController>().initIfNeeded(
          studentController.students.length,
        );
      }
    });

    return Scaffold(
      backgroundColor: AppColors.screen,
      appBar: CommonAppBar(
        color: AppColors.deepBlue,
        onProfileTap: () {
          Navigator.pushNamed(context, AppRoutes.staffProfile);
        },
      ),

      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),

              child: Column(
                children: [
                  const AttendanceHeader(),

                  const SizedBox(height: 20),

                  const AttendanceSummary(),

                  const SizedBox(height: 10),

                  Expanded(
                    child: Consumer<StaffStudentController>(
                      builder: (context, studentController, _) {
                        return studentController.isLoading
                            ? const SingleChildScrollView(
                                child: AttendanceShimmer(),
                              )
                            : studentController.students.isEmpty
                            ? const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Text("No Students"),
                                ),
                              )
                            : SingleChildScrollView(
                                child: AttendanceStudentList(
                                  students: studentController.students,
                                ),
                              );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          Consumer3<
            StaffCourseController,
            StaffStudentController,
            StaffAttendanceController
          >(
            builder:
                (
                  context,
                  courseController,
                  studentController,
                  attendanceController,
                  _,
                ) {
                  return Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),

                    color: AppColors.screen,

                    child: CommonButton(
                      onPressed:
                          attendanceController.isSubmitting ||
                              attendanceController.isSubmitted ||
                              studentController.students.isEmpty
                          ? null
                          : () async {
                              final result = await attendanceController.submit(
                                studentIds: studentController.students
                                    .map((e) => e.id)
                                    .toList(),

                                courseId: courseController
                                    .courses[courseController.selectedIndex]
                                    .id,
                              );

                              if (!context.mounted) {
                                return;
                              }

                              showDialog(
                                context: context,

                                builder: (context) {
                                  return AttendanceResultDialog(result: result);
                                },
                              );
                            },

                      backgroundColor: AppColors.deepBlue,

                      width: double.infinity,

                      txt: attendanceController.isSubmitting
                          ? "Submitting..."
                          : attendanceController.isSubmitted
                          ? "Attendance Submitted"
                          : studentController.students.isEmpty
                          ? "No Students Available"
                          : "Submit Attendance",
                    ),
                  );
                },
          ),

          const SizedBox(height: 85),
        ],
      ),
    );
  }
}
