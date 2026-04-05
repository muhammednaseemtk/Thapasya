import 'package:flutter/material.dart';
import 'package:thapasya/core/constant/app_colors.dart';
import 'package:thapasya/core/constant/app_fonts.dart';
import 'package:thapasya/features/staff/home/widget/common_app_bar.dart';
import 'package:thapasya/features/staff/log/widget/class_summary_card.dart';
import 'package:thapasya/features/staff/log/widget/custom_input_card.dart';
import 'package:thapasya/features/staff/log/widget/log_button.dart';
import 'package:thapasya/features/staff/log/widget/past_log_card.dart';
import 'package:thapasya/features/staff/log/widget/today_date_chip.dart';

class StaffLogScreen extends StatelessWidget {
  const StaffLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screen,
      appBar: StaffCommonAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Daily Log",
                style: AppFonts.poppinsSemiBold5
              ),
            ),

            Padding(padding: const EdgeInsets.all(8.0), child: TodayDateChip()),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClassSummaryCard(),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Expanded(
                    child: CustomInputCard(
                      title: "Topics Covered",
                      hintText: 'Enter..',
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: CustomInputCard(
                      title: "Homework Assigned",
                      hintText: 'Enter..',
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: CustomInputCard(
                      title: "Next Class Topic",
                      hintText: 'Enter..',
                    ),
                  ),
                ],
              ),
            ),

            Padding(padding: const EdgeInsets.all(8.0), child: LogButton()),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Past Logs",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2C2C2C),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PastLogCard(),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PastLogCard(),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PastLogCard(),
            ),
          ],
        ),
      ),
    );
  }
}
