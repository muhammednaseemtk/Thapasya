import 'package:Thapasya/core/constant/app_colors.dart';
import 'package:Thapasya/features/student/course/model/course_item.dart';
import 'package:Thapasya/features/student/course/widget/course_card.dart';
import 'package:Thapasya/features/student/course/widget/course_progress_card.dart';
import 'package:Thapasya/features/student/course/widget/faculty_card.dart';
import 'package:Thapasya/features/student/home/widget/common_app_bar.dart';
import 'package:flutter/material.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screen,

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonAppBar(),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'My Course',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
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
