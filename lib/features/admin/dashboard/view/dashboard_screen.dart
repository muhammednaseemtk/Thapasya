import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_fonts.dart';
import 'package:thapasya/core/constants/app_strings.dart';
import 'package:thapasya/core/widget/common_drawer.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AppDrawer()),
                );
              },
              icon: Icon(Icons.menu_book_outlined),
            ),
            SizedBox(width: 10),
            Text(AppStrings.appName, style: AppFonts.poppinsSemiBold5),
          ],
        ),
      ),
    );
  }
}
