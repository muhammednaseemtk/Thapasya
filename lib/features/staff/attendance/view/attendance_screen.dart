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
                    )
                  else
                    const SizedBox(),

                  const SizedBox(height: 10),

                  CommonButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
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
                                  Navigator.pop(context);
                                },
                                child: const Text("Cancel"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
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
                                          children: const [
                                            Icon(
                                              Icons.check_circle,
                                              color: Colors.green,
                                              size: 60,
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              "Attendance Submitted Successfully",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
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
