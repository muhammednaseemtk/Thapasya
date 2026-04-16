import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  final String text;

  const StatusBadge({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.green.shade100,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Text(
          "Active",
          style: TextStyle(color: Colors.green),
        ),
      ),
    );
  }
}