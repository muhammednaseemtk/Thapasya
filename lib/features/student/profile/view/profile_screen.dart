import 'package:flutter/material.dart';
import 'package:thapasya/core/constant/app_colors.dart';
import 'package:thapasya/features/student/profile/widget/profile_header_card.dart';
import 'package:thapasya/features/student/profile/widget/profile_info_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screen,
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProfileHeaderCard(),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProfileInfoCard(),
            ),
          ],
        ),
      ),
    );
  }
}
