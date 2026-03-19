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
        leadingWidth: 60,
        leading: IconButton(
          constraints: BoxConstraints(),
          onPressed: () {},
          icon: Icon(Icons.menu_book_outlined),
        ),
        titleSpacing: 1,
        title: Text(AppStrings.appName, style: AppFonts.poppinsSemiBold),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person_outline_rounded, color: AppColors.white),
          ),
          SizedBox(width: 6),
        ],
      ),
    );
  }
}
