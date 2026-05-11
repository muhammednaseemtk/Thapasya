import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';
import 'package:thapasya/core/routes/app_routes.dart';
import 'package:thapasya/core/widget/common_button.dart';
import 'package:thapasya/core/widget/common_app_bar.dart';
import 'package:thapasya/features/staff/log/widget/class_summary_card.dart';
import 'package:thapasya/features/staff/log/widget/past_log_card.dart';
import 'package:thapasya/features/staff/log/widget/today_date_chip.dart';

class StaffLogScreen extends StatelessWidget {
  const StaffLogScreen({super.key});

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Daily Log", style: AppFonts.poppinsSemiBold5),
              SizedBox(height: 10),

              TodayDateChip(),

              SizedBox(height: 10),

              ClassSummaryCard(txt: 'Class Summary',),

              SizedBox(height: 10),

              ClassSummaryCard(txt: 'Topics Covered',),
              
              SizedBox(height: 10),

              ClassSummaryCard(txt: 'Next Class Topic',),

              SizedBox(height: 15),

              Center(
                child: CommonButton(
                  onPressed: () {},
                  icon: Icons.send_outlined,
                  backgroundColor: AppColors.deepBlue,
                  width: 350,
                  txt: 'Submit Daily Log',
                ),
              ),
              SizedBox(height: 15),

              Text(
                "Past Logs",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2C2C2C),
                ),
              ),
              SizedBox(height: 10),

              PastLogCard(),
              SizedBox(height: 10),

              PastLogCard(),
              SizedBox(height: 10),

              PastLogCard(),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
