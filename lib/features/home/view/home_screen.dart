import 'package:Thapasya/core/constant/app_colors.dart';
import 'package:Thapasya/core/constant/app_fonts.dart';
import 'package:Thapasya/core/constant/app_strings.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.brightRed,
        title: Text(AppStrings.appName, style: AppFonts.poppinsSemiBold),
        actions: [
          CircleAvatar(
            backgroundColor: AppColors.transparent,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.person_outline_rounded,color: AppColors.white,),
            ),
          ),
          SizedBox(width: 5),
        ],
      ),
    );
  }
}
