import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';

class ProfileInfoCard extends StatelessWidget {
  final String txt;
  final String txt1;
  final String txt2;
  final String txt3;
  final String txt4;
  final String txt5;
  final String txt6;
  const ProfileInfoCard({
    super.key,
    required this.txt,
    required this.txt1,
    required this.txt2,
    required this.txt3,
    required this.txt4,
    required this.txt5,
    required this.txt6
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Text(
            txt,
            style: AppFonts.poppinsSemiBold7,
          ),

          SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(txt1,style: AppFonts.poppinsBold2,), Text(txt2,style: AppFonts.poppinsBold2,)],
          ),

          Divider(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(txt3,style: AppFonts.poppinsBold2,), Text(txt4,style: AppFonts.poppinsBold2,)],
          ),

          Divider(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(txt5,style: AppFonts.poppinsBold2,), Text(txt6,style: AppFonts.poppinsBold2,)],
          ),
        ],
      ),
    );
  }
}
