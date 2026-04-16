import 'package:flutter/material.dart';

class ProgrammeHeader extends StatelessWidget {
  const ProgrammeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Programme Booking\nManagement",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: 6),

        Text(
          "Manage event booking requests and completed programmes",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}