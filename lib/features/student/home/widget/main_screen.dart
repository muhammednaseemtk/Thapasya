import 'package:Thapasya/features/student/home/controller/main_controller.dart';
import 'package:Thapasya/features/student/home/widget/botton_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Consumer<MainController>(
          builder: (context, value, child) {
            return BottomNavBar(
              currentIndex: value.currentIndex,
              onTap: value.changeIndex,
            );
          },
        ),
      ),
    );
  }
}
