import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';

class StaffHeader extends StatelessWidget {
  final VoidCallback onAdd;

  const StaffHeader({super.key, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Staff",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Manage staff details and payroll",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),

        ElevatedButton.icon(
          onPressed: onAdd,
          icon: const Icon(Icons.add, size: 18,color: AppColors.white,),
          label: const Text("Add Staff",style: TextStyle(color: AppColors.white),),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}