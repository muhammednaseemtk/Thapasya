import 'package:Thapasya/features/student/fees/model/payment_item_model.dart';
import 'package:flutter/material.dart';

class PaymentItems extends StatelessWidget {
  final PaymentItemModel item;

  const PaymentItems({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final isPaid = item.status == "Paid";

    final statusColor = isPaid ? Colors.green : Colors.red;
    final bgColor =
        isPaid ? Colors.green.shade50 : Colors.red.shade50;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Left Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.month,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(item.date),
                  Text(item.receipt),
                ],
              ),
            ),

            /// Right Content
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  item.amount,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    item.status,
                    style: TextStyle(color: statusColor),
                  ),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 14),

        /// Divider
        const Divider(height: 1),

        const SizedBox(height: 14),
      ],
    );
  }
}