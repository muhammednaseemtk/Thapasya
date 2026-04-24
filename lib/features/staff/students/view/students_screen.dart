import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';
import 'package:thapasya/core/routes/app_routes.dart';
import 'package:thapasya/core/widget/common_app_bar.dart';
import 'package:thapasya/features/staff/students/controller/staff_student_controller.dart';
import 'package:thapasya/features/staff/students/widget/students_card.dart';

class StaffStudentsScreen extends StatelessWidget {
  const StaffStudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StaffStudentController>(
      builder: (context, controller, _) {

        if (controller.students.isEmpty && !controller.isLoading) {
          Future.microtask(() => controller.fetchStudents(1));
        }

        return Scaffold(
          backgroundColor: AppColors.screen,
          appBar: CommonAppBar(
            color: AppColors.deepBlue,
            onProfileTap: () {
              Navigator.pushNamed(context, AppRoutes.staffProfile);
            },
          ),

          body: controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.deepBlue,
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "My Students",
                              style: AppFonts.poppinsSemiBold5,
                            ),

                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.white70,
                                borderRadius:
                                    BorderRadius.circular(20),
                              ),
                              child: Text(
                                "${controller.students.length} total",
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const StudentsCard(),
                    ],
                  ),
                ),
        );
      },
    );
  }
}