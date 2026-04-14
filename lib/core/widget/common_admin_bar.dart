import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_fonts.dart';
import 'package:thapasya/core/constants/app_strings.dart';

class CommonAdminBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAdminBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 5,

      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.menu_book_outlined),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),

      title: Text(AppStrings.appName, style: AppFonts.poppinsSemiBold5),

      bottom: PreferredSize(
        preferredSize: preferredSize,
        child: Divider(thickness: 1,height: 1,),
      ),
    );
  }
}
