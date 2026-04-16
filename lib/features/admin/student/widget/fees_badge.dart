import 'package:flutter/material.dart';

class FeeBadge extends StatelessWidget {
  final String text;

  const FeeBadge({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final isPaid = text == "Paid";

    return SizedBox(
      width: 110,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: isPaid
              ? Colors.blue.shade100
              : Colors.orange.shade100,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isPaid ? Colors.blue : Colors.orange,
          ),
        ),
      ),
    );
  }
}