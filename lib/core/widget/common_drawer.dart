import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_fonts.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Header
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "School ERP\nAdmin",
                style: AppFonts.poppinsSemiBold5,
              ),
            ),

            const Divider(),

            // 🔹 Menu Items
            ListTile(
              leading: const Icon(Icons.dashboard_outlined),
              title: const Text("Dashboard"),
              selected: true,
              selectedTileColor: Colors.blue,
              selectedColor: Colors.white,
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.people_outline),
              title: const Text("Students"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.badge_outlined),
              title: const Text("Staff"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.notifications_none),
              title: const Text("Notifications"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.message_outlined),
              title: const Text("Enquiry Box"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today_outlined),
              title: const Text("Programme Booking"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.attach_money_outlined),
              title: const Text("Salary Management"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.account_balance_wallet_outlined),
              title: const Text("Fees Management"),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}