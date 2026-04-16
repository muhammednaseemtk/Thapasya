import 'package:flutter/material.dart';
import 'package:thapasya/core/widget/common_admin_bar.dart';
import 'package:thapasya/core/widget/common_drawer.dart';
import 'package:thapasya/features/staff/home/widget/staff_dashboard_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:  CommonDrawer(), 
      appBar:  CommonAdminBar(), 
      body: SingleChildScrollView(child: Column(
        children: [
          
        ],
      )),
    );
  }
}