import 'package:flutter/material.dart';
import 'package:thapasya/features/staff/home/widget/common_app_bar.dart';

class StaffAssessmentScreen extends StatelessWidget {
  const StaffAssessmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StaffCommonAppBar(),
    );
  }
}