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
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final imageSize = screenWidth * 0.11;
    final iconSize = screenWidth * 0.06;
    final spacing = screenWidth * 0.015;
    final horizontalPadding = screenWidth * 0.02;
    final topPadding = screenWidth * 0.06;

    return AppBar(
      backgroundColor: color,
      toolbarHeight: 90,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Padding(
        padding: EdgeInsets.only(
          top: topPadding,
          left: horizontalPadding,
          right: horizontalPadding,
        ),

        child: Row(
          children: [
            Image.asset(
              'assets/images/header_icon.png',
              width: imageSize,
              height: imageSize,
              fit: BoxFit.contain,
            ),

            SizedBox(width: spacing),

            Expanded(
              child: Text(
                AppStrings.appName,
                overflow: TextOverflow.ellipsis,
                style: AppFonts.poppinsSemiBold4,
              ),
            ),

            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: onProfileTap ?? () {},
              icon: const Icon(Iconsax.user),
              color: AppColors.white,
              iconSize: iconSize,
            ),
            SizedBox(width: spacing),
          ],
        ),
      ),
    );
  }
}
