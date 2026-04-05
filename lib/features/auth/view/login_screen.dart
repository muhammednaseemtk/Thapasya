import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';
import 'package:thapasya/core/constants/app_strings.dart';
import 'package:thapasya/core/routes/app_routes.dart';
import 'package:thapasya/features/auth/controller/login_tab_bar_controller.dart';
import 'package:thapasya/features/auth/widget/login_button.dart';
import 'package:thapasya/features/auth/widget/login_tab_bar.dart';
import 'package:thapasya/features/auth/widget/login_tab_bar_item.dart';
import 'package:thapasya/features/auth/widget/login_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final items = LoginTabBarItem.items(
      emailController: emailController,
      phoneController: phoneController,
    );
    return Scaffold(
      resizeToAvoidBottomInset: true,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
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
                  gradient: LinearGradient(colors: AppColors.splashGradient),
                  borderRadius: BorderRadius.only(
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

                      SizedBox(height: 20),

                      LoginTabBar(items: items),

                      SizedBox(height: 20),

                      Consumer<LoginTabBarController>(
                        builder: (context, controller, _) {
                          return IndexedStack(
                            index: controller.currentIndex,
                            children: items.map((e) => e.widget).toList(),
                          );
                        },
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
                          final email = emailController.text.trim();
                          final password = passwordController.text.trim();
                          if (email == "student@gmail.com" &&
                              password == "123") {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              AppRoutes.studentMain,
                              (route) => false,
                            );
                          } else if (email == "staff@gmail.com" &&
                              password == "123") {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              AppRoutes.staffMain,
                              (route) => false,
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Invalid Credentials. Try student@test.com or staff@test.com",
                                ),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
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
