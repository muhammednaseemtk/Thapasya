import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_fonts.dart';

class LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const LegendItem({
    super.key,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            border: Border.all(color: color),
          ),
        ),
        const SizedBox(width: 6),
        Text(label,style: AppFonts.poppinsBold2,),
      ],
    );
  }
}