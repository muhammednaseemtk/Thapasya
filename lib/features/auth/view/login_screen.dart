import 'package:Thapasya/core/constant/app_colors.dart';
import 'package:Thapasya/core/constant/app_fonts.dart';
import 'package:Thapasya/core/constant/app_strings.dart';
import 'package:Thapasya/features/auth/widget/login_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 330,
            child: Center(
              child: Image.asset(
                'asset/image/thapasya_image2.png',
                height: 250,
              ),
            ),
          ),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: AppColors.splashGradient),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                ),
              ),

              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 25,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20),

                    Text(AppStrings.login, style: AppFonts.login),

                    SizedBox(height: 40),

                    LoginTextField(
                      txt: AppStrings.emailHint,
                      controller: emailController,
                      obsecureTxt: false,
                      icon: Icons.mail,
                    ),

                    SizedBox(height: 20),

                    LoginTextField(
                      txt: AppStrings.passwordHint,
                      controller: passwordController,
                      obsecureTxt: true,
                      icon: Icons.visibility,
                    ),

                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
