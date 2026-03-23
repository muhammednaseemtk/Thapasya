import 'package:Thapasya/core/constant/app_colors.dart';
import 'package:Thapasya/core/constant/app_fonts.dart';
import 'package:Thapasya/core/constant/app_strings.dart';
import 'package:flutter/material.dart';


class CommonAppBar extends StatelessWidget {
  final VoidCallback? onMenuTap;
  final VoidCallback? onProfileTap;

  const CommonAppBar({
    super.key,
    this.onMenuTap,
    this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: AppColors.white,
      backgroundColor: AppColors.brightRed,
      toolbarHeight: 60,
      leadingWidth: 60,

      leading: IconButton(
        constraints:  BoxConstraints(),
        onPressed: onMenuTap ?? () {},
        icon:  Icon(Icons.menu_book_outlined),
      ),

      titleSpacing: 1,
      title: Text(
        AppStrings.appName,
        style: AppFonts.poppinsSemiBold,
      ),

      actions: [
        IconButton(
          onPressed: onProfileTap ?? () {},
          icon:  Icon(Icons.person_outline_rounded),
        ),
         SizedBox(width: 6),
      ],
    );
  }
}