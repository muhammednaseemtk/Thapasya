import 'package:Thapasya/core/constant/app_colors.dart';
import 'package:Thapasya/features/student/fees/model/payment_item_model.dart';
import 'package:Thapasya/features/student/fees/widget/fees_alert_card.dart';
import 'package:Thapasya/features/student/fees/widget/fees_summary_card.dart';
import 'package:Thapasya/features/student/fees/widget/pay_fees_button.dart';
import 'package:Thapasya/features/student/fees/widget/payment_history_card.dart';
import 'package:Thapasya/features/student/home/widget/common_app_bar.dart';
import 'package:flutter/material.dart';

class FeesScreen extends StatelessWidget {
  const FeesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screen,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CommonAppBar(),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Fees & Payments',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            FeesAlertCard(
              title: "Fee Due Soon",
              message: "March 2026 fee of ₹2,500 is due by March 25",
            ),

            SizedBox(height: 10),

            Row(
              children: [
                /// 🔴 Pending Amount Card
                FeesSummaryCard(
                  title: "Pending Amount",
                  amount: "₹2,500",
                  subtitle: "Due Mar 25, 2026",
                  bgColor: const Color(0xFFB71C1C), // deep red
                  textColor: Colors.white,
                ),

                /// ⚪ Total Paid Card
                FeesSummaryCard(
                  title: "Total Paid (2026)",
                  amount: "₹5,000",
                  subtitle: "2 months settled",
                  bgColor: const Color(0xFFF2F2F2),
                  textColor: Colors.green,
                ),
              ],
            ),
            SizedBox(height: 10),

            PayFeesButton(text: "Pay March Fee – ₹2,500", onTap: () {}),

            PaymentHistoryCard(
              items: [
                PaymentItemModel(
                  month: "February 2026",
                  date: "Paid on Feb 3, 2026",
                  receipt: "RCP-001",
                  amount: "₹2,500",
                  status: "Paid",
                ),
                PaymentItemModel(
                  month: "January 2026",
                  date: "Paid on Jan 5, 2026",
                  receipt: "RCP-002",
                  amount: "₹2,500",
                  status: "Paid",
                ),
                PaymentItemModel(
                  month: "March 2026",
                  date: "Due: Mar 25, 2026",
                  receipt: "RCP-003",
                  amount: "₹2,500",
                  status: "Pending",
                ),
                PaymentItemModel(
                  month: "December 2025",
                  date: "Paid on Dec 4, 2025",
                  receipt: "RCP-004",
                  amount: "₹2,500",
                  status: "Paid",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
