import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';
import 'package:thapasya/core/routes/app_routes.dart';
import 'package:thapasya/core/widget/common_app_bar.dart';
import 'package:thapasya/features/staff/home/controller/staff_course_controller.dart';
import 'package:thapasya/features/staff/log/controller/daily_log_controller.dart';
import 'package:thapasya/features/staff/log/controller/past_log_controller.dart';
import 'package:thapasya/features/staff/log/widget/class_summary_card.dart';
import 'package:thapasya/features/staff/log/widget/past_logs_section.dart';
import 'package:thapasya/features/staff/log/widget/submit_log_button.dart';
import 'package:thapasya/features/staff/log/widget/today_date_chip.dart';

final _staffLogFormKey = GlobalKey<FormState>();

class StaffLogScreen extends StatelessWidget {
  const StaffLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<StaffCourseController>().fetchIfNeeded();
      context.read<PastLogController>().fetchIfNeeded();
    });

    return Consumer3<
      DailyLogController,
      PastLogController,
      StaffCourseController
    >(
      builder: (context, dailyController, pastController, courseController, _) {
        return Scaffold(
          backgroundColor: AppColors.screen,
          appBar: CommonAppBar(
            color: AppColors.deepBlue,
            onProfileTap: () {
              Navigator.pushNamed(context, AppRoutes.staffProfile);
            },
          ),

          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Form(
                key: _staffLogFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Daily Log", style: AppFonts.poppinsSemiBold5),

                    const SizedBox(height: 10),

                    const TodayDateChip(),

                    const SizedBox(height: 10),

                    ClassSummaryCard(
                      txt: 'Class Summary',
                      controller: dailyController.classSummaryController,
                      hint: "Describe today's class activities...",
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) {
                          return "Please enter class summary";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 10),

                    ClassSummaryCard(
                      txt: 'Topics Covered',
                      controller: dailyController.topicsCoveredController,
                      hint: "Topics covered...",
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) {
                          return "Please enter topics covered";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 10),

                    ClassSummaryCard(
                      txt: 'Next Class Topic',
                      controller: dailyController.nextClassTopicController,
                      hint: "Next class topic...",
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) {
                          return "Please enter next class topic";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 15),

                    SubmitLogButton(formKey: _staffLogFormKey),

                    const SizedBox(height: 20),

                    const Text(
                      "Past Logs",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2C2C2C),
                      ),
                    ),

                    const SizedBox(height: 10),

                    const PastLogsSection(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
