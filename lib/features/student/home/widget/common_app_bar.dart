import 'package:Thapasya/core/constant/app_colors.dart';
import 'package:Thapasya/core/constant/app_fonts.dart';
import 'package:Thapasya/core/constant/app_strings.dart';
import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuTap;
  final VoidCallback? onProfileTap;

  const CommonAppBar({
    super.key,
    this.onMenuTap,
    this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.brightRed,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),

      child: SafeArea(
        child: Row(
          children: [
            /// Menu Icon
            IconButton(
              onPressed: onMenuTap ?? () {},
              icon: const Icon(
                Icons.menu_book_outlined,
                color: AppColors.white,
              ),
            ),

            /// Title
            Expanded(
              child: Text(
                AppStrings.appName,
                style: AppFonts.poppinsSemiBold.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),

            /// Profile Icon
            IconButton(
              onPressed: onProfileTap ?? () {},
              icon: const Icon(
                Icons.person_outline_rounded,
                color: AppColors.white,
              ),
            ),

            const SizedBox(width: 6),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}