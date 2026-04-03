import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thapasya/features/student/home/controller/main_controller.dart';
import 'package:thapasya/features/student/home/widget/botton_nav_bar.dart';

class StudentMainScreen extends StatelessWidget {
  const StudentMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Consumer<StudentMainController>(
        builder: (context, value, child) {
          return StudentBottomNavBar(
            currentIndex: value.currentIndex,
            onTap: value.changeIndex,
          );
        },
      ),
    );
  }
}
