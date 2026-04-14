import 'package:flutter/material.dart';
import 'package:thapasya/core/widget/common_admin_bar.dart';
import 'package:thapasya/core/widget/common_drawer.dart';

class StudentScreen extends StatelessWidget {
  const StudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:  CommonDrawer(), 
      appBar:  CommonAdminBar(), 
    );
  }
}