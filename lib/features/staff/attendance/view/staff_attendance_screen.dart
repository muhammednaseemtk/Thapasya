import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/routes/app_routes.dart';
import 'package:thapasya/core/widget/common_app_bar.dart';
import 'package:thapasya/core/widget/common_button.dart';
import 'package:thapasya/features/staff/attendance/controller/staff_attendance_controller.dart';
import 'package:thapasya/features/staff/attendance/widget/attendance_header.dart';
import 'package:thapasya/features/staff/attendance/widget/attendance_result_dialog.dart';
import 'package:thapasya/features/staff/attendance/widget/attendance_state.dart';
import 'package:thapasya/features/staff/attendance/widget/attendance_student_list.dart';
import 'package:thapasya/features/staff/attendance/widget/attendance_summary.dart';
import 'package:thapasya/features/staff/students/controller/staff_student_controller.dart';

class StaffAttendanceScreen extends StatelessWidget {
  const StaffAttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screen,
      appBar: CommonAppBar(
        color: AppColors.deepBlue,
        onProfileTap: () {
          Navigator.pushNamed(context, AppRoutes.staffProfile);
        },
      ),

      body: Consumer2<StaffStudentController, StafffAttendanceController>(
        builder: (context, studentController, attendanceController, _) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (studentController.students.isEmpty &&
                !studentController.isLoading) {
              studentController.fetchStudents(1);
            }

            if (attendanceController.statusList.length !=
                studentController.students.length) {
              attendanceController.init(studentController.students.length);
            }
          });

          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 12,
                  ),

                  child: Column(
                    children: [
                      const AttendanceHeader(),

                      const SizedBox(height: 20),

                      const AttendanceSummary(),

                      const SizedBox(height: 10),

                      Expanded(
                        child: SingleChildScrollView(
                          child:
                              studentController.isLoading ||
                                  studentController.students.isEmpty
                              ? AttendanceState(
                                  isLoading: studentController.isLoading,

                                  isEmpty: studentController.students.isEmpty,
                                )
                              : AttendanceStudentList(
                                  students: studentController.students,
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),

                color: AppColors.screen,

                child: CommonButton(
                  onPressed:
                      attendanceController.isSubmitting ||
                          attendanceController.isSubmitted
                      ? () {}
                      : () async {
                          final result = await attendanceController.submit(
                            studentIds: studentController.students
                                .map((e) => e.id)
                                .toList(),

                            courseId: 1,
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
                      : "Submit Attendance",
                ),
              ),

              const SizedBox(height: 85),
            ],
          );
        },
      ),
    );
  }
}
