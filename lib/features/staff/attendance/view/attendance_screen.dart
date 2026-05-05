import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/routes/app_routes.dart';
import 'package:thapasya/core/widget/common_app_bar.dart';
import 'package:thapasya/core/widget/common_button.dart';
import 'package:thapasya/features/staff/attendance/controller/attendance_controller.dart';
import 'package:thapasya/features/staff/attendance/widget/attendance_action_card.dart';
import 'package:thapasya/features/staff/attendance/widget/attendance_header.dart';
import 'package:thapasya/features/staff/attendance/widget/attendance_summary.dart';
import 'package:thapasya/features/staff/attendance/widget/batch_info_card.dart';

class StaffAttendanceScreen extends StatelessWidget {
  const StaffAttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final students = [
      "Priya Krishnamurthy",
      "Arun Kumar",
      "Meera Nair",
      "Rahul Das",
      "Anjali Menon",
    ];

    return Scaffold(
      backgroundColor: AppColors.screen,
      appBar: CommonAppBar(
        color: AppColors.deepBlue,
        onProfileTap: () {
          Navigator.pushNamed(context, AppRoutes.staffProfile);
        },
      ),
      body: Consumer<AttendanceController>(
        builder: (context, controller, _) {
          if (controller.statusList.length != students.length) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              controller.init(students.length);
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

                  if (controller.statusList.length == students.length)
                    Column(
                      children: List.generate(students.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: AttendanceActionCard(
                            name: students[index],
                            index: index,
                          ),
                        );
                      }),
                    ),

                  const SizedBox(height: 10),

                  CommonButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            title: const Text("Confirm Attendance"),
                            content: const Text(
                              "Are you sure you want to submit attendance?",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(dialogContext);
                                },
                                child: const Text("Cancel"),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  Navigator.pop(dialogContext);

                                  final controller =
                                      Provider.of<AttendanceController>(
                                        context,
                                        listen: false,
                                      );

                                  final studentIds = [1, 2, 3, 4, 5];
                                  final courseId = 1;

                                  final success = await controller.submit(
                                    studentIds,
                                    courseId,
                                  );

                                  if (!context.mounted) return;

                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              success
                                                  ? Icons.check_circle
                                                  : Icons.error,
                                              color: success
                                                  ? Colors.green
                                                  : Colors.red,
                                              size: 60,
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              success
                                                  ? "Attendance Submitted Successfully"
                                                  : "Failed to Submit Attendance",
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                              ),
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
                                child: const Text("Confirm"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    backgroundColor: AppColors.deepBlue,
                    width: 350,
                    txt: 'Submit Attendance',
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
