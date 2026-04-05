import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';
import 'package:thapasya/core/routes/app_routes.dart';
import 'package:thapasya/features/staff/profile/widget/button.dart';

class StaffProfileScreen extends StatelessWidget {
  const StaffProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screen,
      appBar: AppBar(
        backgroundColor: AppColors.deepBlue,
        foregroundColor: AppColors.white,
        title: Text('Profile',style: AppFonts.poppinsSemiBold4,),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
        ],
      ),
      body: Center(child: Button(onPressed: () {
        Navigator.pushReplacementNamed(context, AppRoutes.login);
      }, txt: 'Logout')),
    );
  }
}