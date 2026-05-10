import 'package:flutter/material.dart';
import 'package:thapasya/features/staff/attendance/widget/attendance_action_card.dart';
import 'package:thapasya/features/staff/students/model/staff_student_model.dart';

class AttendanceStudentList extends StatelessWidget {
  final List<StaffStudentModel> students;

  const AttendanceStudentList({super.key, required this.students});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(students.length, (index) {
        final student = students[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 10),

          child: AttendanceActionCard(name: student.name, index: index),
        );
      }),
    );
  }
}
