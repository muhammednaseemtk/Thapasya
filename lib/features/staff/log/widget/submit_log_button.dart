import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/widget/common_button.dart';
import 'package:thapasya/features/staff/home/controller/staff_course_controller.dart';
import 'package:thapasya/features/staff/log/controller/daily_log_controller.dart';
import 'package:thapasya/features/staff/log/controller/past_log_controller.dart';
import 'package:thapasya/features/staff/log/widget/success_dialog.dart';

class SubmitLogButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const SubmitLogButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Consumer3<
      DailyLogController,
      PastLogController,
      StaffCourseController
    >(
      builder: (context, dailyController, pastController, courseController, _) {
        return Center(
          child: CommonButton(
            onPressed: dailyController.isLoading
                ? null
                : () async {
                    final currentState = formKey.currentState;
                    if (currentState == null || !currentState.validate())
                      return;

                    if (courseController.courses.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("No courses available")),
                      );
                      return;
                    }

                    if (dailyController.isTodayLogSubmitted(
                      pastController.logs,
                    )) {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          backgroundColor: AppColors.white,
                          title: const Text(
                            "Already Submitted",
                            style: TextStyle(color: AppColors.deepBlue),
                          ),
                          content: const Text(
                            "Log already submitted for today",
                            style: TextStyle(color: AppColors.deepBlue),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text(
                                "OK",
                                style: TextStyle(color: AppColors.deepBlue),
                              ),
                            ),
                          ],
                        ),
                      );
                      dailyController.classSummaryController.clear();
                      dailyController.topicsCoveredController.clear();
                      dailyController.nextClassTopicController.clear();
                      return;
                    }

                    final courseId = courseController
                        .courses[courseController.selectedIndex]
                        .id;

                    final result = await dailyController.submitLog(courseId);

                    debugPrint("SUBMIT RESULT : $result");

                    if (!context.mounted) return;

                    if (result == "success") {
                      await showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) {
                          return const SuccessDialog();
                        },
                      );

                      pastController.resetFetch();

                      await pastController.fetchLogs(courseId);
                    } else {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(result)));
                    }
                  },

            icon: dailyController.isLoading ? null : Icons.send_outlined,

            backgroundColor: AppColors.deepBlue,

            width: 350,

            txt: dailyController.isLoading
                ? "Submitting..."
                : "Submit Daily Log",
          ),
        );
      },
    );
  }
}
