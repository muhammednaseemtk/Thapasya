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
    return Container(
      height: 80, 
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.brightRed,
      ),
    
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
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
                style: AppFonts.poppinsSemiBold4
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