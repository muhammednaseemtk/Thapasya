import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';
import 'package:thapasya/core/widget/common_button.dart';
import 'package:thapasya/features/staff/assessment/widget/student_assessment_card.dart';
import 'package:thapasya/core/widget/common_app_bar.dart';

class StaffAssessmentScreen extends StatelessWidget {
  const StaffAssessmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screen,
      appBar: CommonAppBar(color: AppColors.deepBlue,),
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

            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: CommonButton(
                onPressed: () {},
                backgroundColor: AppColors.deepBlue,
                width: 350,
                txt: 'Save All Assessments',
              ),
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}
