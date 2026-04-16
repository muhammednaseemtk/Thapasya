import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/widget/common_admin_bar.dart';
import 'package:thapasya/core/widget/common_drawer.dart';
import 'package:thapasya/features/admin/programme%20booking/widget/programme_header.dart';
import 'package:thapasya/features/admin/programme%20booking/widget/programme_tab_bar.dart';

class ProgrammeBookingScreen extends StatelessWidget {
  const ProgrammeBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screen,
      drawer: CommonDrawer(),
      appBar: CommonAdminBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ProgrammeHeader(),
              ProgrammeTabBar(),
            ],
          ),
        ),
      ),
    );
  }
}
