import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/widget/common_button.dart';
import 'package:thapasya/features/staff/log/controller/daily_log_controller.dart';
import 'package:thapasya/features/staff/log/controller/past_log_controller.dart';
import 'package:thapasya/features/staff/log/widget/success_dialog.dart';

class SubmitLogButton extends StatelessWidget {
  const SubmitLogButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<DailyLogController, PastLogController>(
      builder: (context, dailyController, pastController, _) {
        return Center(
          child: IgnorePointer(
            ignoring: dailyController.isLoading,
            child: CommonButton(
              onPressed: () async {
                final result = await dailyController.submitLog();

                if (!context.mounted) return;

                if (result == "success") {
                  await showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) {
                      return const SuccessDialog();
                    },
                  );
                  pastController.isFetched = false;
                  await pastController.fetchLogs();
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
          ),
        );
      },
    );
  }
}
