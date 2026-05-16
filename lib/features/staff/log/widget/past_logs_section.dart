import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/widget/common_button.dart';
import 'package:thapasya/features/staff/log/controller/past_log_controller.dart';
import 'package:thapasya/features/staff/log/widget/past_log_card.dart';

class PastLogsSection extends StatelessWidget {
  const PastLogsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final pastController = context.watch<PastLogController>();

    if (pastController.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (pastController.logs.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text("No Logs Found"),
        ),
      );
    }

    final visibleLogs =
        pastController.showAllLogs ? pastController.logs : pastController.logs.take(2).toList();

    return Column(
      children: [
        ...List.generate(visibleLogs.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: PastLogCard(log: visibleLogs[index]),
          );
        }),
        if (pastController.isExpanding)
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Column(
              children: List.generate(
                pastController.logs.length - 2,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
          ),
        if (!pastController.showAllLogs &&
            !pastController.isExpanding &&
            pastController.logs.length > 2)
          CommonButton(
            onPressed: () async => await pastController.toggleShowAll(),
            txt: "View More",
            backgroundColor: AppColors.deepBlue,
            width: 350,
          ),
      ],
    );
  }
}
