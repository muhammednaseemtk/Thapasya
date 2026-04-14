import 'package:flutter/material.dart';
import 'package:thapasya/core/widget/common_admin_bar.dart';
import 'package:thapasya/core/widget/common_drawer.dart';

class EnquiryboxScreen extends StatelessWidget {
  const EnquiryboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer:  CommonDrawer(), 
      appBar:  CommonAdminBar(), 
    );
  }
}