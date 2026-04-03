import 'package:flutter/material.dart';
import 'package:thapasya/core/constant/app_colors.dart';
import 'package:thapasya/core/constant/app_fonts.dart';
import 'package:thapasya/features/student/fees/model/payment_item_model.dart';

class PaymentItems extends StatelessWidget {
  final PaymentItemModel item;

  const PaymentItems({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final isPaid = item.status == "Paid";

    final statusColor = isPaid ? AppColors.green : AppColors.darkRed;
    final bgColor = isPaid ? AppColors.lightGreen : AppColors.lightRed;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.month, style: AppFonts.poppinsSemiBold),
                  const SizedBox(height: 4),
                  Text(item.date, style: AppFonts.poppinsBold2),
                  Text(item.receipt, style: AppFonts.poppinsBold2),
                ],
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(item.amount, style: AppFonts.poppinsSemiBold),
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
                    style: AppFonts.poppinsSemiBold2.copyWith(
                      color: statusColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 14),

        const Divider(height: 1),

        const SizedBox(height: 14),
      ],
    );
  }
}
