import 'package:flutter/material.dart';
import 'package:thapasya/core/constant/app_fonts.dart';

class InfoItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const InfoItem({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: AppFonts.poppinsBold
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: AppFonts.poppinsBold3
        ),
      ],
    );
  }
}