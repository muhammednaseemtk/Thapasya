import 'package:Thapasya/features/auth/controller/login_tab_bar_controller.dart';
import 'package:Thapasya/features/auth/widget/login_tab_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginTabBar extends StatelessWidget {
  const LoginTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginTabBarController>(
      builder: (context, controller, _) {
        return Container(
          padding:  EdgeInsets.all(4),
          decoration: BoxDecoration(
            color:  Color(0xFFEDE7E3),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              LoginTabBarItem(
                index: 0,
                selectedIndex: controller.selectedIndex,
                icon: Icons.email_outlined,
                text: "Email",
              ),
              LoginTabBarItem(
                index: 1,
                selectedIndex: controller.selectedIndex,
                icon: Icons.phone_outlined,
                text: "Phone",
              ),
            ],
          ),
        );
      },
    );
  }
}