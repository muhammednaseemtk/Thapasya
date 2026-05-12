import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

    return Column(
      children: List.generate(pastController.logs.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: PastLogCard(log: pastController.logs[index]),
        );
      }),
    );
  }
}
