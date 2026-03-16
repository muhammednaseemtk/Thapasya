import 'package:Thapasya/core/constant/app_colors.dart';
import 'package:Thapasya/features/auth/widget/login_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 330,
            child: Center(child: Image.asset('asset/image/thapasya_image2.png',height: 250,)),
          ),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: AppColors.splashGradient),
                borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
              ),

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 25),
                child: Column(
                  children: [
                    Text(),

                    SizedBox(height: 20,),
                    LoginTextField()
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