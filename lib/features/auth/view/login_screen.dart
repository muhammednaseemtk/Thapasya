import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';
import 'package:thapasya/core/constants/app_strings.dart';
import 'package:thapasya/features/auth/widget/login_button.dart';
import 'package:thapasya/features/auth/widget/login_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final horizontalPadding = screenWidth * 0.06;
    final topPadding = screenHeight * 0.03;
    final imageHeight = screenHeight * 0.25;
    final titleSpacing = screenHeight * 0.008;
    final fieldSpacing = screenHeight * 0.025;
    final buttonSpacing = screenHeight * 0.02;

    return Scaffold(
      backgroundColor: AppColors.screen,
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Center(
                  child: Image.asset(
                    'assets/images/thapasya_image2.png',
                    height: imageHeight,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              Expanded(
                flex: 6,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: AppColors.splashGradient),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                      left: horizontalPadding,
                      right: horizontalPadding,
                      top: topPadding,
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            AppStrings.loginHeading,
                            style: AppFonts.poppinsSemiBold1,
                          ),
                        ),

                        SizedBox(height: titleSpacing),

                        Center(
                          child: Text(
                            AppStrings.loginSubtitle,
                            style: AppFonts.poppinsRegular,
                          ),
                        ),

                        SizedBox(height: fieldSpacing),

                        LoginTextField(
                          txt: 'enter username..',
                          controller: usernameController,
                          obsecureTxt: false,
                          icon: Iconsax.user_tag,
                        ),

                        SizedBox(height: fieldSpacing),

                        LoginTextField(
                          txt: AppStrings.passwordHint,
                          controller: passwordController,
                          obsecureTxt: true,
                          icon: Iconsax.lock_circle,
                        ),

                        SizedBox(height: screenHeight * 0.01),

                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},

                            child: Text(
                              AppStrings.forgotPass,
                              style: AppFonts.poppinsBold,
                            ),
                          ),
                        ),

                        SizedBox(height: buttonSpacing),

                        Center(
                          child: LoginButton(
                            usernameController: usernameController,
                            passwordController: passwordController,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
