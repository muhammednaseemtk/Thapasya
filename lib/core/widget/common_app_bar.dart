import 'package:flutter/material.dart';
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
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(color: color),

      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Row(
          children: [
            IconButton(
              constraints: const BoxConstraints(),
              onPressed: onMenuTap ?? () {},
              icon: const Icon(Icons.menu_book_outlined),
              color: AppColors.white,
              iconSize: 25,
            ),

            const SizedBox(width: 8),

            Expanded(
              child: Text(
                AppStrings.appName,
                style: AppFonts.poppinsSemiBold4,
              ),
            ),

            IconButton(
              onPressed: onProfileTap ?? () {},
              icon: const Icon(Icons.person_outline_rounded),
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