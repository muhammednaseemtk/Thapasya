import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';
import 'package:thapasya/core/constants/app_strings.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? color;
  final VoidCallback? onMenuTap;
  final VoidCallback? onProfileTap;

  const CommonAppBar({
    super.key,
    this.color,
    this.onMenuTap,
    this.onProfileTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(90);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color,
      toolbarHeight: 90,
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
        child: Row(
          children: [
            Image.asset('assets/images/header_icon.png', width: 45, height: 45),

            const SizedBox(width: 8),

            Expanded(
              child: Text(AppStrings.appName, style: AppFonts.poppinsSemiBold4),
            ),

            IconButton(
              onPressed: onProfileTap ?? () {},
              icon: const Icon(Iconsax.user),
              color: AppColors.white,
              iconSize: 25,
            ),

            const SizedBox(width: 6),
          ],
        ),
      ),
    );
  }
}
