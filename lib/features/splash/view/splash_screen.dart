import 'package:Thapasya/core/constant/app_colors.dart';
import 'package:Thapasya/core/constant/app_fonts.dart';
import 'package:Thapasya/core/constant/app_strings.dart';
import 'package:Thapasya/core/routes/app_routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    goLogin();
  }

  Future<void> goLogin() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: AppColors.splashGradient)
        ),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/thapasya_image1.png',width: 250,),
        
                Text(AppStrings.appSubtitle, style: AppFonts.poppinsRegular),
              ],
            ),
          ),
      ),
    );
  }
}
