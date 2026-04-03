import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thapasya/features/staff/home/controller/main_controller.dart';
import 'package:thapasya/features/staff/home/widget/bottom_nav_bar.dart';

class StaffMainScreen extends StatelessWidget {
  const StaffMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Consumer<StaffMainController>(
        builder: (context, value, child) {
          return StaffBottomNavBar(
            currentIndex: value.currentIndex,
            onTap: value.changeIndex,
          );
        },
      ),
    );
  }
}
