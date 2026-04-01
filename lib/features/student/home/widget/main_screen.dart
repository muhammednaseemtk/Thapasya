import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thapasya/features/student/home/controller/main_controller.dart';
import 'package:thapasya/features/student/home/widget/botton_nav_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
