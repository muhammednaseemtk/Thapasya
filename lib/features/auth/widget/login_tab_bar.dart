import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thapasya/core/constant/app_colors.dart';
import '../controller/login_tab_bar_controller.dart';
import '../model/login_tab_item.dart';

class LoginTabBar extends StatelessWidget {
  final List<LoginTabItem> items;

  const LoginTabBar({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginTabBarController>(
      builder: (context, controller, _) {
        return DefaultTabController(
          length: items.length,
          initialIndex: controller.currentIndex,
          child: Builder(
            builder: (context) {
              final tabController = DefaultTabController.of(context);

              return ButtonsTabBar(
                borderColor: AppColors.brightRed,
                backgroundColor: AppColors.white,
                unselectedBackgroundColor: AppColors.white,
                labelStyle: TextStyle(color: AppColors.brightRed),
                contentCenter: true,
                splashColor: const Color.fromARGB(255, 180, 100, 100),
                width: 160,
                unselectedLabelStyle: TextStyle(color: AppColors.textField),
                radius: 10,
                contentPadding: EdgeInsets.symmetric(horizontal: 15),

                onTap: (index) {
                  context.read<LoginTabBarController>().changeIndex(index);
                  tabController.animateTo(index);
                },

                tabs: items
                    .map((e) => Tab(icon: Icon(e.icon), text: e.title))
                    .toList(),
              );
            },
          ),
        );
      },
    );
  }
}
