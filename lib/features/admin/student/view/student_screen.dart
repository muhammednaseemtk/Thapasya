import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/widget/common_admin_bar.dart';
import 'package:thapasya/core/widget/common_drawer.dart';
import 'package:thapasya/features/admin/student/widget/add_student_dialog.dart';
import 'package:thapasya/core/widget/common_search_filter.dart';
import 'package:thapasya/features/admin/student/widget/student_table_data.dart';
import 'package:thapasya/features/admin/student/widget/students_header.dart';

class StudentScreen extends StatelessWidget {
  const StudentScreen({super.key});

  void openAddStudentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AddStudentDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screen,
      drawer: const CommonDrawer(),
      appBar: const CommonAdminBar(),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            StudentsHeader(onAdd: () => openAddStudentDialog(context)),
            const SizedBox(height: 20),
            const CommonSearchFilter(text: 'Search by name or roll number...',),
            Expanded(child: StudentTableData()),
          ],
        ),
      ),
    );
  }
}