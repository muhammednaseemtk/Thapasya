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
    final keyboard = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      backgroundColor: AppColors.screen,
      resizeToAvoidBottomInset: true,

      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),

        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Center(
                  child: Image.asset(
                    'assets/images/thapasya_image2.png',
                    height: 250,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              Expanded(
                flex: 6,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: AppColors.splashGradient,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),

                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                      left: 25,
                      right: 25,
                      top: 25,
                      bottom: keyboard + 20,
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

                        const SizedBox(height: 5),

                        Center(
                          child: Text(
                            AppStrings.loginSubtitle,
                            style: AppFonts.poppinsRegular,
                          ),
                        ),

                        const SizedBox(height: 35),

                        LoginTextField(
                          txt: 'enter username..',
                          controller: usernameController,
                          obsecureTxt: false,
                          icon: Iconsax.user_tag,
                        ),

                        const SizedBox(height: 25),

                        LoginTextField(
                          txt: AppStrings.passwordHint,
                          controller: passwordController,
                          obsecureTxt: true,
                          icon: Iconsax.lock_circle,
                        ),

                        const SizedBox(height: 15),

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

                        const SizedBox(height: 25),

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