import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';
import 'package:thapasya/core/widget/common_button.dart';
import 'package:thapasya/features/auth/controller/auth_logout_controller.dart';
import 'package:thapasya/features/student/profile/widget/profile_header_card.dart';
import 'package:thapasya/features/student/profile/widget/profile_info_card.dart';

class StudentProfileScreen extends StatelessWidget {
  const StudentProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screen,
      appBar: AppBar(
        backgroundColor: AppColors.darkRed,
        foregroundColor: AppColors.white,
        title: Text('Profile',style: AppFonts.poppinsSemiBold4,),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProfileHeaderCard(),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProfileInfoCard(
                txt: 'Personal Information',
                txt1: 'Date of Birth',
                txt2: 'March 12,2009',
                txt3: 'Gender',
                txt4: 'Female',
                txt5: 'Blood Group',
                txt6: 'B+',
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProfileInfoCard(
                txt: 'Contact Details',
                txt1: 'Phone',
                txt2: '+91 98765433210',
                txt3: 'Email',
                txt4: 'Midlaj@gmail.com',
                txt5: 'Address',
                txt6: '42,Anna Nagar,Chennai',
              ),
            ),

            SizedBox(height: 20),

            Consumer<AuthLogoutController>(
              builder: (context, logoutController, child) {
                return CommonButton(
                  onPressed: logoutController.isLoading
                      ? null
                      : () => logoutController.logout(context),
                  backgroundColor: AppColors.darkRed,
                  width: 320,
                  txt: logoutController.isLoading ? 'Logging out...' : 'Logout',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
