import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';
import 'package:thapasya/core/constants/app_strings.dart';
import 'package:thapasya/core/routes/app_routes.dart';
import 'package:thapasya/core/network/auth_token.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    initApp();
  }

  Future<void> initApp() async {
    await AuthToken.loadToken();

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    if (AuthToken.token != null) {
      Navigator.pushReplacementNamed(context, AppRoutes.staffMain);
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: AppColors.splashGradient),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/thapasya_image1.png',
                width: 250,
              ),

              const SizedBox(height: 10),

              Text(
                AppStrings.appSubtitle,
                style: AppFonts.poppinsRegular,
              ),
            ],
          ),
        ),
      ),
    );
  }
}