import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/widget/common_admin_bar.dart';
import 'package:thapasya/core/widget/common_drawer.dart';
import 'package:thapasya/features/admin/dashboard/widget/dashboard_card.dart';
import 'package:thapasya/features/admin/dashboard/widget/growth_chart.dart';
import 'package:thapasya/features/admin/dashboard/widget/recent_activity.dart';
import 'package:thapasya/features/admin/dashboard/widget/revenue_chart.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

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
              DashboardCard(
                title: "Total Students",
                value: "567",
                percentage: "+12.5% from last month",
                icon: Icons.group,
                iconBgColor: Colors.blue,
              ),
              DashboardCard(
                title: "Total Staff",
                value: "54",
                percentage: "+8.3% from last month",
                icon: Icons.person,
                iconBgColor: Colors.green,
              ),
              DashboardCard(
                title: "Total Revenue",
                value: "₹67,000",
                percentage: "+21.8% from last month",
                icon: Icons.attach_money,
                iconBgColor: Colors.purple,
              ),
              DashboardCard(
                title: "Growth Rate",
                value: "18.5%",
                percentage: "+3.2% from last month",
                icon: Icons.trending_up,
                iconBgColor: Colors.orange,
              ),

              SizedBox(height: 10),

              RevenueChart(),

              SizedBox(height: 10),

              GrowthChart(),
              RecentActivity(),
            ],
          ),
        ),
      ),
    );
  }
}
