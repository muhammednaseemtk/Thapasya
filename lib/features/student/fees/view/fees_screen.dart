import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';
import 'package:thapasya/features/student/fees/model/payment_item_model.dart';
import 'package:thapasya/features/student/fees/widget/fees_alert_card.dart';
import 'package:thapasya/features/student/fees/widget/fees_summary_card.dart';
import 'package:thapasya/features/student/fees/widget/pay_fees_button.dart';
import 'package:thapasya/features/student/fees/widget/payment_history_card.dart';
import 'package:thapasya/features/student/home/widget/common_app_bar.dart';

class StudentFeesScreen extends StatelessWidget {
  const StudentFeesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screen,
      appBar: StudentCommonAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text('Fees & Payments', style: AppFonts.poppinsSemiBold5),
            ),

            FeesAlertCard(
              title: "Fee Due Soon",
              message: "March 2026 fee of ₹2,500 is due by March 25",
            ),

            SizedBox(height: 10),

            Row(
              children: [
                FeesSummaryCard(
                  title: "Pending Amount",
                  amount: "₹2,500",
                  subtitle: "Due Mar 25, 2026",
                  bgColor: AppColors.darkRed, 
                  textColor: AppColors.white,
                ),

                FeesSummaryCard(
                  title: "Total Paid (2026)",
                  amount: "₹5,000",
                  subtitle: "2 months settled",
                  bgColor: AppColors.white,
                  textColor: AppColors.green,
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
