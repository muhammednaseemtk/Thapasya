import 'package:Thapasya/features/student/attendance/view/attendance_screen.dart';
import 'package:Thapasya/features/student/course/view/course_screen.dart';
import 'package:Thapasya/features/student/fees/view/fees_screen.dart';
import 'package:Thapasya/features/student/home/controller/main_controller.dart';
import 'package:Thapasya/features/student/home/view/home_screen.dart';
import 'package:Thapasya/features/student/home/widget/botton_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Widget> pages = [
      HomeScreen(),
      AttendanceScreen(),
      CourseScreen(),
      FeesScreen()
    ];

    return Scaffold(
      body: Consumer<MainController>(
        builder: (context, value, child) {
          return IndexedStack(
            index: value.currentIndex,
            children: pages,
          );
        },
      ),

      bottomNavigationBar: Consumer<MainController>(
        builder: (context, value, child) {
          return BottomNavBar(
            currentIndex: value.currentIndex,
            onTap: value.changeIndex,
          );
        },
      ),
    );
  }
}