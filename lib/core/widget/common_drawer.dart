import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/constants/app_fonts.dart';
import 'package:thapasya/core/routes/app_routes.dart';
import 'package:thapasya/features/admin/dashboard/controller/drawer_controller.dart';

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Drawer(
        child: Consumer<DrawersController>(
          builder: (context, controller, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "School ERP\nAdmin",
                    style: AppFonts.poppinsSemiBold5,
                  ),
                ),

                const Divider(),

                ListTile(
                  leading: const Icon(Icons.dashboard_outlined),
                  title: const Text("Dashboard"),
                  selected: controller.selectedIndex == 0, 
                  selectedTileColor: AppColors.deepBlue,
                  selectedColor: AppColors.white,
                  onTap: () {
                    controller.changeIndex(0); 
                    Navigator.pushReplacementNamed(
                        context, AppRoutes.adminDashBoard);
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.people_outline),
                  title: const Text("Students"),
                  selected: controller.selectedIndex == 1,
                  selectedTileColor: AppColors.deepBlue,
                  selectedColor: AppColors.white,
                  onTap: () {
                    controller.changeIndex(1);
                    Navigator.pushReplacementNamed(
                        context, AppRoutes.adminStudent);
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.badge_outlined),
                  title: const Text("Staff"),
                  selected: controller.selectedIndex == 2,
                  selectedTileColor: AppColors.deepBlue,
                  selectedColor: AppColors.white,
                  onTap: () {
                    controller.changeIndex(2);
                    Navigator.pushReplacementNamed(
                        context, AppRoutes.adminStaff);
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.notifications_none),
                  title: const Text("Notifications"),
                  selected: controller.selectedIndex == 3,
                  selectedTileColor: AppColors.deepBlue,
                  selectedColor: AppColors.white,
                  onTap: () {
                    controller.changeIndex(3);
                    Navigator.pushReplacementNamed(
                        context, AppRoutes.adminNotification);
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.message_outlined),
                  title: const Text("Enquiry Box"),
                  selected: controller.selectedIndex == 4,
                  selectedTileColor: AppColors.deepBlue,
                  selectedColor: AppColors.white,
                  onTap: () {
                    controller.changeIndex(4);
                    Navigator.pushReplacementNamed(
                        context, AppRoutes.adminEnquiryBox);
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.calendar_today_outlined),
                  title: const Text("Programme Booking"),
                  selected: controller.selectedIndex == 5,
                  selectedTileColor: AppColors.deepBlue,
                  selectedColor: AppColors.white,
                  onTap: () {
                    controller.changeIndex(5);
                    Navigator.pushReplacementNamed(
                        context, AppRoutes.adminProgramme);
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.attach_money_outlined),
                  title: const Text("Salary Management"),
                  selected: controller.selectedIndex == 6,
                  selectedTileColor: AppColors.deepBlue,
                  selectedColor: AppColors.white,
                  onTap: () {
                    controller.changeIndex(6);
                    Navigator.pushReplacementNamed(
                        context, AppRoutes.adminSalary);
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.account_balance_wallet_outlined),
                  title: const Text("Fees Management"),
                  selected: controller.selectedIndex == 7,
                  selectedTileColor: AppColors.deepBlue,
                  selectedColor: AppColors.white,
                  onTap: () {
                    controller.changeIndex(7);
                    Navigator.pushReplacementNamed(
                        context, AppRoutes.adminFees);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}