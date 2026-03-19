import 'package:Thapasya/core/constant/app_colors.dart';
import 'package:Thapasya/core/constant/app_fonts.dart';
import 'package:Thapasya/core/constant/app_strings.dart';
import 'package:Thapasya/core/routes/app_routes.dart';
import 'package:Thapasya/features/auth/widget/login_button.dart';
import 'package:Thapasya/features/auth/widget/login_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Center(
                  child: Image.asset(
                    'assets/images/thapasya_image2.png',
                    height: 260,
                  ),
                ),
              ),

              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: AppColors.splashGradient,
                  ),
                  borderRadius:  BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45),
                  ),
                ),

                child: Padding(
                  padding: EdgeInsets.only(
                    left: 28,
                    right: 28,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 95,
                  ),
                  child: Column(
                    children: [
                       SizedBox(height: 30),

                      Text(
                        AppStrings.loginHeading,
                        style: AppFonts.poppinsSemiBold1,
                      ),

                       SizedBox(height: 5),

                      Text(
                        AppStrings.loginSubtitle,
                        style: AppFonts.poppinsRegular,
                      ),

                       SizedBox(height: 55),

                      LoginTextField(
                        txt: AppStrings.emailHint,
                        controller: emailController,
                        obsecureTxt: false,
                        icon: Icons.mail_outline_outlined,
                      ),

                       SizedBox(height: 20),

                      LoginTextField(
                        txt: AppStrings.passwordHint,
                        controller: passwordController,
                        obsecureTxt: true,
                        icon: Icons.lock_outline_rounded,
                      ),

                       SizedBox(height: 10),

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

                       SizedBox(height: 10),

                      LoginButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.home);
                        },
                        txt: AppStrings.login,
                      ),

                       SizedBox(height: 30),
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