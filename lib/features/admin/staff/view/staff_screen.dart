import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/widget/common_admin_bar.dart';
import 'package:thapasya/core/widget/common_drawer.dart';
import 'package:thapasya/core/widget/common_search_filter.dart';
import 'package:thapasya/features/admin/staff/widget/add_staff_dialog.dart';
import 'package:thapasya/features/admin/staff/widget/staff_card.dart';
import 'package:thapasya/features/admin/staff/widget/staff_header.dart';

class StaffScreen extends StatelessWidget {
  const StaffScreen({super.key});

  void openAddStaffDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => const AddStaffDialog());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screen,
      drawer: const CommonDrawer(),
      appBar: const CommonAdminBar(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              StaffHeader(onAdd: () => openAddStaffDialog(context)),
        
               SizedBox(height: 20),
        
              CommonSearchFilter(text: 'Search by name or department..'),
        
              SizedBox(height: 10,),
        
              StaffCard(
                name: "Dr. Anjali Verma",
                role: "Senior Teacher",
                subject: "Mathematics",
              ),
              StaffCard(
                name: "Rahul Kumar",
                role: "Physics Teacher",
                subject: "Physics",
              ),
              StaffCard(
                name: "Sneha Iyer",
                role: "English Teacher",
                subject: "English",
              ),
              StaffCard(
                name: "Dr. Anjali Verma",
                role: "Senior Teacher",
                subject: "Mathematics",
              ),
              StaffCard(
                name: "Rahul Kumar",
                role: "Physics Teacher",
                subject: "Physics",
              ),
              StaffCard(
                name: "Sneha Iyer",
                role: "English Teacher",
                subject: "English",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
