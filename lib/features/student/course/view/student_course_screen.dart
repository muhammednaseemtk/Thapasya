import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';
import 'package:thapasya/core/routes/app_routes.dart';
import 'package:thapasya/core/widget/common_app_bar.dart';
import 'package:thapasya/features/student/course/model/course_item.dart';
import 'package:thapasya/features/student/course/widget/course_card.dart';
import 'package:thapasya/features/student/course/widget/course_progress_card.dart';
import 'package:thapasya/features/student/course/widget/faculty_card.dart';

class StudentCourseScreen extends StatelessWidget {
  const StudentCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screen,
      appBar: CommonAppBar(color: AppColors.darkRed,onProfileTap: () {
        Navigator.pushNamed(context, AppRoutes.studentProfile);
      },),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text('My Course', style: AppFonts.poppinsSemiBold5),
            ),
            CourseCard(),

            CourseProgressCard(
              progress: 0.68,
              items: [
                CourseItem(
                  title: "Foundation (Adavus)",
                  subtitle: "Sep 2025",
                  status: "Done",
                ),
                CourseItem(
                  title: "Alarippu & Jatiswaram",
                  subtitle: "Nov 2025",
                  status: "Done",
                ),
                CourseItem(
                  title: "Shabdam",
                  subtitle: "Ongoing",
                  status: "Active",
                ),
                CourseItem(
                  title: "Varnam",
                  subtitle: "Apr 2026",
                  status: "Soon",
                ),
                CourseItem(
                  title: "Padam & Javali",
                  subtitle: "Sep 2026",
                  status: "Soon",
                ),
              ],
            ),

            FacultyCard(
              initials: "SK",
              name: "Smt. Kavitha Rajan",
              role: "Senior Bharatanatyam Faculty",
              rating: 5.0,
            ),

            FacultyCard(
              initials: "SK",
              name: "Smt. Kavitha Rajan",
              role: "Senior Bharatanatyam Faculty",
              rating: 5.0,
            ),
          ],
        ),
      ),
    );
  }
}
