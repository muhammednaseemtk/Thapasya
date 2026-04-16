import 'package:flutter/material.dart';
import 'package:thapasya/core/constants/app_colors.dart';
import 'package:thapasya/core/widget/common_admin_bar.dart';
import 'package:thapasya/core/widget/common_drawer.dart';
import 'package:thapasya/features/admin/enquiry%20box/widget/empty_enquiry_view.dart';
import 'package:thapasya/features/admin/enquiry%20box/widget/enquiry_header.dart';
import 'package:thapasya/features/admin/enquiry%20box/widget/enquiry_list.dart';

class EnquiryboxScreen extends StatelessWidget {
  const EnquiryboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.screen,
      drawer:  CommonDrawer(), 
      appBar:  CommonAdminBar(), 
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              EnquiryHeader(),
              EnquiryList(),
              SizedBox(height: 10,),
              EmptyEnquiryView(),
            ],
          ),
        ),
      ),
    );
  }
}