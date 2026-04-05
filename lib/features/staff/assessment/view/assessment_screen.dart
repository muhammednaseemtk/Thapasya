import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';
import 'package:thapasya/features/staff/assessment/widget/assessment_button.dart';
import 'package:thapasya/features/staff/assessment/widget/student_assessment_card.dart';
import 'package:thapasya/features/staff/home/widget/common_app_bar.dart';

class StaffAssessmentScreen extends StatelessWidget {
  const StaffAssessmentScreen({super.key});

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
                "Student Assessment",
                style: AppFonts.poppinsSemiBold5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Rate students and add progress notes",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6B7280),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: StudentAssessmentCard(),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: StudentAssessmentCard(),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: StudentAssessmentCard(),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: StudentAssessmentCard(),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: StudentAssessmentCard(),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AssessmentsButton(),
            ),
          ],
        ),
      ),
    );
  }
}
