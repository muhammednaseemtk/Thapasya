import 'package:flutter/widgets.dart';
import 'package:thapasya/features/admin/dashboard/view/dashboard_screen.dart';
import 'package:thapasya/features/auth/view/login_screen.dart';
import 'package:thapasya/features/splash/view/splash_screen.dart';
import 'package:thapasya/features/staff/home/view/home_screen.dart';
import 'package:thapasya/features/staff/home/widget/main_screen.dart';
import 'package:thapasya/features/staff/profile/view/profile_screen.dart';
import 'package:thapasya/features/student/home/view/home_screen.dart';
import 'package:thapasya/features/student/home/widget/main_screen.dart';
import 'package:thapasya/features/student/profile/view/profile_screen.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String studentHome = '/student_home';
  static const String studentMain = '/student_main';
  static const String studentProfile = '/student_profile';
  static const String staffMain = '/staff_main';
  static const String staffHome = '/staff_home';
  static const String staffProfile = '/staff_profile';
  static const String adminDashBoard = '/admin_dashboard';
  

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => SplashScreen(),
    login: (context) => LoginScreen(),
    studentHome: (context) => StudentHomeScreen(),
    studentMain: (context) => StudentMainScreen(),
    studentProfile: (context) => StudentProfileScreen(),
    staffMain: (context) => StaffMainScreen(),
    staffHome: (context) => StaffHomeScreen(),
    staffProfile: (context) => StaffProfileScreen(),
    adminDashBoard: (context) => DashboardScreen(),
  };
}
