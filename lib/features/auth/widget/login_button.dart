import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';
import 'package:thapasya/core/constants/app_strings.dart';
import 'package:thapasya/core/routes/app_routes.dart';
import 'package:thapasya/core/widget/common_button.dart';
import 'package:thapasya/features/auth/controller/auth_controller.dart';

class LoginButton extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const LoginButton({
    super.key,
    required this.usernameController,
    required this.passwordController,
  });

  Future<void> login(BuildContext context, AuthController c) async {
    final result = await c.login(
      username: usernameController.text.trim(),
      password: passwordController.text.trim(),
    );

    if (!context.mounted) return;

    if (result != null) {
      final route = result['role'] == "student"
          ? AppRoutes.studentMain
          : AppRoutes.staffMain;

      Navigator.pushNamedAndRemoveUntil(context, route, (_) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            c.errorMessage ?? "Login Failed",
            style: AppFonts.poppinsBold,
          ),
          backgroundColor: AppColors.darkRed,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(
      builder: (context, c, _) {
        return c.isLoading
            ? const SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.white,
                ),
              )
            : CommonButton(
                onPressed: () => login(context, c),
                backgroundColor: AppColors.darkRed,
                txt: AppStrings.login,
                width: 300,
              );
      },
    );
  }
}