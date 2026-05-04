import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';
import 'package:thapasya/features/staff/students/controller/staff_student_controller.dart';
import 'package:thapasya/features/staff/students/widget/student_shimmer_card.dart';

class StudentsCard extends StatelessWidget {
  const StudentsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StaffStudentController>(
      builder: (context, controller, _) {
        if (controller.isLoading) {
          return Column(
            children: List.generate(2, (index) => const StudentCardShimmer()),
          );
        }

        if (controller.students.isEmpty) {
          return const Padding(
            padding: EdgeInsets.all(20),
            child: Text("No Students"),
          );
        }

        return Column(
          children: List.generate(controller.students.length, (index) {
            final student = controller.students[index];

            final initials = student.name.length >= 2
                ? student.name.substring(0, 2).toUpperCase()
                : student.name.toUpperCase();

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black10,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: AppColors.deepBlue,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Center(
                        child: Text(
                          initials,
                          style: AppFonts.poppinsSemiBold2,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        student.name,
                        style: AppFonts.poppinsSemiBold9,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        );
      },
    );
  }
}