import 'package:flutter/material.dart';
import 'package:thapasya/features/staff/home/widget/common_app_bar.dart';

class StaffStudentsScreen extends StatelessWidget {
  const StaffStudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StaffCommonAppBar(),
    );
  }
}