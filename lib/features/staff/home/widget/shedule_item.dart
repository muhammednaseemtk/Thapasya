import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_fonts.dart';

class ScheduleItem extends StatelessWidget {
  final String title;
  final String date;
  final String time;


  const ScheduleItem({
    super.key,
    required this.title,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppFonts.poppinsSemiBold9
        ),
        Text(
          date,
          style: AppFonts.poppinsRegular1,
        ),
        Text(
          time,
          style: AppFonts.poppinsRegular1,
        ),
      ],
    );
  }
}