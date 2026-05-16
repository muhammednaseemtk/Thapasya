import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';
import 'package:thapasya/core/widget/common_button.dart';
import 'package:thapasya/features/auth/controller/auth_logout_controller.dart';

class StaffProfileScreen extends StatelessWidget {
  const StaffProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final logoutController = context.read<AuthLogoutController>();

    return Scaffold(
      backgroundColor: AppColors.screen,
      appBar: AppBar(
        backgroundColor: AppColors.deepBlue,
        foregroundColor: AppColors.white,
        title: Text('Profile', style: AppFonts.poppinsSemiBold4),
        centerTitle: true,
      ),
      body: Center(
        child: CommonButton(
          onPressed: logoutController.isLoading
              ? null
              : () => logoutController.logout(context),
          backgroundColor: AppColors.deepBlue,
          width: 350,
          txt: logoutController.isLoading ? 'Logging out...' : 'Logout',
        ),
      ),
    );
  }
}
