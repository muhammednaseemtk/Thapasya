import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thapasya/core/routes/app_routes.dart';
import 'package:thapasya/features/admin/dashboard/controller/drawer_controller.dart';
import 'package:thapasya/features/admin/programme%20booking/controller/number_stepper_controller.dart';
import 'package:thapasya/features/auth/controller/auth_controller.dart';
import 'package:thapasya/features/staff/home/controller/category_controller.dart';
import 'package:thapasya/features/staff/home/controller/main_controller.dart';
import 'package:thapasya/features/student/attendance/controller/attendance_calender_controller.dart';
import 'package:thapasya/features/student/home/controller/main_controller.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StudentMainController()),
        ChangeNotifierProvider(create: (_) => StaffMainController()),
        ChangeNotifierProvider(create: (_) => CategoryController()),
        ChangeNotifierProvider(create: (_) => AttendanceCalendarController()),
        ChangeNotifierProvider(create: (_) => DrawersController()),
        ChangeNotifierProvider(create: (_) => NumberStepperController()),
        ChangeNotifierProvider(create: (_) => AuthController()),
      ],
      child: ThapasyaApp(),
    ),
  );
}

class ThapasyaApp extends StatelessWidget {
  const ThapasyaApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.login,
      routes: AppRoutes.routes,
    );
  }
}
