import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_fonts.dart';

class CourseToggle extends StatelessWidget {
  const CourseToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white, 
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "Bharatanatyam",
                style: AppFonts.poppinsSemiBold2.copyWith(
                  color: Colors.red,
                ),
              ),
            ),
          ),

          SizedBox(width: 10,),

          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white, 
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "Kuchipudi",
                style: AppFonts.poppinsSemiBold2.copyWith(
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}