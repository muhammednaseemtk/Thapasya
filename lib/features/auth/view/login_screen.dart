import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';
import 'package:thapasya/core/constants/app_strings.dart';
import 'package:thapasya/core/routes/app_routes.dart';
import 'package:thapasya/core/widget/common_button.dart';
import 'package:thapasya/features/auth/service/auth_service.dart';
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
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 350,
                        width: double.infinity,
                        child: Center(
                          child: Image.asset(
                            'assets/images/thapasya_image2.png',
                            height: 260,
                          ),
                        ),
                      ),

                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: AppColors.splashGradient,
                            ),
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
                              bottom:
                                  MediaQuery.of(context).viewInsets.bottom + 80,
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
                                  txt: 'enter username',
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
                                  child: CommonButton(
                                    onPressed: () async {
                                      final username = usernameController.text
                                          .trim();
                                      final password = passwordController.text
                                          .trim();

                                      final result = await AuthService()
                                          .loginUser(
                                            username: username,
                                            password: password,
                                          );
                                      if (!context.mounted) return;

                                      if (result != null &&
                                          result['message'] ==
                                              "Login succesfull!") {
                                        final role = result['role'];

                                        if (role == "student") {
                                          Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            AppRoutes.studentMain,
                                            (route) => false,
                                          );
                                        } else if (role == "staff") {
                                          Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            AppRoutes.staffMain,
                                            (route) => false,
                                          );
                                        }
                                      } else {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              result?['message'] ??
                                                  "Login Failed",
                                              style: AppFonts.poppinsBold,
                                            ),
                                            backgroundColor: AppColors.darkRed,
                                          ),
                                        );
                                      }
                                    },
                                    backgroundColor: AppColors.darkRed,
                                    txt: AppStrings.login,
                                    width: 300,
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
          },
        ),
      ),
    );
  }
}
