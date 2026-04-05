import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_strings.dart';
import 'package:thapasya/features/auth/model/login_tab_item.dart';
import 'package:thapasya/features/auth/widget/login_text_field.dart';

class LoginTabBarItem {
  static List<LoginTabItem> items({
    required TextEditingController emailController,
    required TextEditingController phoneController,
  }) {
    return [
      LoginTabItem(
        title: "Email",
        icon: Icons.email_outlined,
        widget: LoginTextField(
          txt: AppStrings.emailHint,
          controller: emailController,
          obsecureTxt: false,
          icon: Icons.email_outlined,
        ),
      ),
      LoginTabItem(
        title: "Phone",
        icon: Icons.phone_outlined,
        widget: LoginTextField(
          txt: AppStrings.phoneHint,
          controller: phoneController,
          obsecureTxt: false,
          icon: Icons.phone_outlined,
        ),
      ),
    ];
  }
}
