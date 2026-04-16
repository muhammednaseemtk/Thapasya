import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';

class StudentsHeader extends StatelessWidget {
  final VoidCallback onAdd;

  const StudentsHeader({super.key, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Students",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Manage student accounts and details",
                style: TextStyle(color: Colors.grey),
                overflow: TextOverflow.ellipsis, 
              ),
            ],
          ),
        ),

        const SizedBox(width: 10),

        ElevatedButton.icon(
          onPressed: onAdd,
          icon: const Icon(Icons.add,color: AppColors.white,),
          label:  Text("Add Student",style: TextStyle(color: AppColors.white),),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.deepBlue,
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}