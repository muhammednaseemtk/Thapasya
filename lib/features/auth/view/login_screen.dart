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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              SizedBox(
                height: 350,
                width: double.infinity,
                child: Center(
                  child: Image.asset(
                    'assets/images/thapasya_image2.png',
                    height: 260,
                    filterQuality: FilterQuality.low,
                  ),
                ),
              ),

              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: AppColors.splashGradient),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 28,
                    right: 28,
                    top: 30,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 80,
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

                      const SizedBox(height: 20),

                      LoginTextField(
                        txt: 'enter username..',
                        controller: usernameController,
                        obsecureTxt: false,
                        icon: Iconsax.user_tag,
                      ),

                      const SizedBox(height: 20),

                      LoginTextField(
                        txt: AppStrings.passwordHint,
                        controller: passwordController,
                        obsecureTxt: true,
                        icon: Iconsax.lock_circle,
                      ),

                      const SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              AppStrings.forgotPass,
                              style: AppFonts.poppinsBold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

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
            ],
          ),
        ),
      ),
    );
  }
}
