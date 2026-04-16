import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/widget/common_admin_bar.dart';
import 'package:thapasya/core/widget/common_drawer.dart';
import 'package:thapasya/core/widget/common_summary_card.dart';
import 'package:thapasya/features/admin/salary%20management/widget/salary_header.dart';
import 'package:thapasya/features/admin/salary%20management/widget/salary_search_box.dart';
import 'package:thapasya/features/admin/salary%20management/widget/staff_salary_table.dart';

class SalaryManagementScreen extends StatelessWidget {
  const SalaryManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      drawer: CommonDrawer(),
      appBar: CommonAdminBar(),
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Column(
          children: [
            Align(alignment: AlignmentGeometry.topLeft, child: SalaryHeader()),
            SizedBox(height: 10),
            CommonSummaryCard(
              title: "Total Monthly Payroll",
              value: "₹228,000",
              icon: Icons.attach_money,
              iconColor: Colors.blue,
            ),
            CommonSummaryCard(
              title: "Paid This Month",
              value: "4",
              icon: Icons.check_circle,
              iconColor: Colors.green,
            ),
            CommonSummaryCard(
              title: "Pending Payments",
              value: "2",
              icon: Icons.access_time,
              iconColor: Colors.orange,
            ),

            SalarySearchBox(),

            Expanded(child: StaffSalaryTable()),
          ],
        ),
      ),
    );
  }
}
