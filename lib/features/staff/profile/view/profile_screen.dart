import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';
import 'package:thapasya/core/routes/app_routes.dart';
import 'package:thapasya/core/widget/common_button.dart';
import 'package:thapasya/core/network/auth_token.dart';

class StaffProfileScreen extends StatelessWidget {
  const StaffProfileScreen({super.key});

  Future<void> logout(BuildContext context) async {
    await AuthToken.clear();

    if (!context.mounted) return;

    Navigator.pushNamedAndRemoveUntil(context, AppRoutes.login, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screen,
      appBar: AppBar(
        backgroundColor: AppColors.deepBlue,
        foregroundColor: AppColors.white,
        title: Text('Profile', style: AppFonts.poppinsSemiBold4),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
        ],
      ),
      body: Center(
        child: CommonButton(
          onPressed: () => logout(context),
          backgroundColor: AppColors.deepBlue,
          width: 350,
          txt: 'Logout',
        ),
      ),
    );
  }
}
