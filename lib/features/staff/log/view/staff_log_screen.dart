import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';
import 'package:thapasya/core/routes/app_routes.dart';
import 'package:thapasya/core/widget/common_app_bar.dart';
import 'package:thapasya/core/widget/common_button.dart';
import 'package:thapasya/features/staff/log/controller/daily_log_controller.dart';
import 'package:thapasya/features/staff/log/controller/past_log_controller.dart';
import 'package:thapasya/features/staff/log/widget/class_summary_card.dart';
import 'package:thapasya/features/staff/log/widget/past_log_card.dart';
import 'package:thapasya/features/staff/log/widget/today_date_chip.dart';

class StaffLogScreen extends StatelessWidget {
  const StaffLogScreen({super.key});

  Future<void> loadLogs(BuildContext context) async {
    final pastController = context.read<PastLogController>();

    if (!pastController.isFetched && !pastController.isLoading) {
      await pastController.fetchLogs();
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.microtask(() {
      loadLogs(context);
    });

    return Scaffold(
      backgroundColor: AppColors.screen,

      appBar: CommonAppBar(
        color: AppColors.deepBlue,
        onProfileTap: () {
          Navigator.pushNamed(context, AppRoutes.staffProfile);
        },
      ),

      body: Consumer2<DailyLogController, PastLogController>(
        builder: (context, dailyController, pastController, _) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),

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
                  ),

                  const SizedBox(height: 10),

                  ClassSummaryCard(
                    txt: 'Topics Covered',

                    controller: dailyController.topicsCoveredController,

                    hint: "Topics covered...",
                  ),

                  const SizedBox(height: 10),

                  ClassSummaryCard(
                    txt: 'Next Class Topic',

                    controller: dailyController.nextClassTopicController,

                    hint: "Next class topic...",
                  ),

                  const SizedBox(height: 15),

                  Center(
                    child: CommonButton(
                      onPressed: dailyController.isLoading
                          ? () {}
                          : () async {
                              final result = await dailyController.submitLog();

                              if (!context.mounted) {
                                return;
                              }

                              ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(SnackBar(content: Text(result)));

                              if (result == "success") {
                                pastController.isFetched = false;

                                await pastController.fetchLogs();
                              }
                            },

                      icon: Icons.send_outlined,

                      backgroundColor: AppColors.deepBlue,

                      width: 350,

                      txt: dailyController.isLoading
                          ? "Submitting..."
                          : 'Submit Daily Log',
                    ),
                  ),

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

                  if (pastController.isLoading)
                    const Center(child: CircularProgressIndicator())
                  else if (pastController.logs.isEmpty)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text("No Logs Found"),
                      ),
                    )
                  else
                    Column(
                      children: List.generate(pastController.logs.length, (
                        index,
                      ) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),

                          child: PastLogCard(log: pastController.logs[index]),
                        );
                      }),
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
