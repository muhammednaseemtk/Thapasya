import 'package:Thapasya/core/constant/app_fonts.dart';
import 'package:Thapasya/core/constant/app_strings.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.appName,style: AppFonts.poppinsSemiBold,),
      ),
    );
  }
}