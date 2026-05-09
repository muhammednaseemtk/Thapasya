import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/routes/app_routes.dart';
import 'package:thapasya/core/widget/common_app_bar.dart';
import 'package:thapasya/core/widget/common_button.dart';
import 'package:thapasya/features/staff/attendance/controller/staff_attendance_controller.dart';
import 'package:thapasya/features/staff/attendance/widget/attendance_action_card.dart';
import 'package:thapasya/features/staff/attendance/widget/attendance_header.dart';
import 'package:thapasya/features/staff/attendance/widget/attendance_summary.dart';
import 'package:thapasya/features/staff/attendance/widget/batch_info_card.dart';
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
          if (studentController.students.isEmpty &&
              !studentController.isLoading) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              studentController.fetchStudents(1);
            });
          }

          if (attendanceController.statusList.length !=
              studentController.students.length) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              attendanceController.init(studentController.students.length);
            });
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),

              child: Column(
                children: [
                  const AttendanceHeader(),

                  const SizedBox(height: 10),

                  const BatchInfoCard(),

                  const SizedBox(height: 20),

                  const AttendanceSummary(),

                  const SizedBox(height: 10),

                  if (studentController.isLoading)
                    const Center(child: CircularProgressIndicator())
                  else if (studentController.students.isEmpty)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text("No Students"),
                      ),
                    )
                  else
                    Column(
                      children: List.generate(
                        studentController.students.length,

                        (index) {
                          final student = studentController.students[index];

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),

                            child: AttendanceActionCard(
                              name: student.name,
                              index: index,
                            ),
                          );
                        },
                      ),
                    ),

                  const SizedBox(height: 10),

                  CommonButton(
                    onPressed: attendanceController.isSubmitting
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
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),

                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,

                                    children: [
                                      Icon(
                                        result == "success"
                                            ? Icons.check_circle
                                            : Icons.error,

                                        color: result == "success"
                                            ? Colors.green
                                            : Colors.red,

                                        size: 60,
                                      ),

                                      const SizedBox(height: 12),

                                      Text(
                                        result == "success"
                                            ? "Attendance Submitted Successfully"
                                            : result,

                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),

                                  actions: [
                                    Center(
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },

                                        child: const Text("OK"),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },

                    backgroundColor: AppColors.deepBlue,

                    width: 350,

                    txt: attendanceController.isSubmitting
                        ? "Submitting..."
                        : "Submit Attendance",
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
