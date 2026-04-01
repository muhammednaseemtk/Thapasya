import 'package:flutter/material.dart';
import 'package:thapasya/features/student/fees/model/payment_item_model.dart';
import 'package:thapasya/features/student/fees/widget/payment_items.dart';

class PaymentHistoryCard extends StatelessWidget {
  final List<PaymentItemModel> items;

  const PaymentHistoryCard({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF2F2F2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Payment History",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),

            const SizedBox(height: 16),

            ...items.map((e) => PaymentItems(item: e)).toList(),
          ],
        ),
      ),
    );
  }
}
