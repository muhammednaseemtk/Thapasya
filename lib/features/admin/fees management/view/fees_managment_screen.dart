import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/widget/common_admin_bar.dart';
import 'package:thapasya/core/widget/common_drawer.dart';
import 'package:thapasya/core/widget/common_summary_card.dart';
import 'package:thapasya/features/admin/fees%20management/widget/fees_header.dart';
import 'package:thapasya/features/admin/fees%20management/widget/fees_table.dart';
import 'package:thapasya/features/admin/fees%20management/widget/pending_fees_summary.dart';
import 'package:thapasya/features/admin/fees%20management/widget/search_status_filter.dart';

class FeesManagmentScreen extends StatelessWidget {
  const FeesManagmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screen,
      drawer: const CommonDrawer(),
      appBar: const CommonAdminBar(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FeesHeader(),

              const SizedBox(height: 10),

              const CommonSummaryCard(
                title: "Total Expected",
                value: "₹270,000",
                icon: Icons.attach_money,
                iconColor: Colors.blue,
              ),
              const CommonSummaryCard(
                title: "Total Collected",
                value: "₹188,000",
                icon: Icons.trending_up,
                iconColor: Colors.green,
              ),
              const CommonSummaryCard(
                title: "Total Pending",
                value: "₹82,000",
                icon: Icons.access_time,
                iconColor: Colors.orange,
              ),
              const CommonSummaryCard(
                title: "Collection Rate",
                value: "69.6%",
                icon: Icons.show_chart,
                iconColor: Colors.purple,
              ),

              const SizedBox(height: 10),

              const SearchStatusFilter(
                hintText: "Search by name or roll number...",
              ),

              const SizedBox(height: 10),

              SizedBox(
                height: 500,
                child: const FeesTable(),
              ),
              PendingFeesSummary(),
            ],
          ),
        ),
      ),
    );
  }
}