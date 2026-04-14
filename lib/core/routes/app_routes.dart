import 'package:flutter/widgets.dart';
import 'package:thapasya/features/admin/dashboard/view/dashboard_screen.dart';
import 'package:thapasya/features/admin/enquiry%20box/view/enquirybox_screen.dart';
import 'package:thapasya/features/admin/fees%20management/view/fees_managment_screen.dart';
import 'package:thapasya/features/admin/notification/view/admin_notification_screen.dart';
import 'package:thapasya/features/admin/programme%20booking/view/programme_booking_screen.dart';
import 'package:thapasya/features/admin/salary%20management/view/salary_management_screen.dart';
import 'package:thapasya/features/admin/staff/view/staff_screen.dart';
import 'package:thapasya/features/admin/student/view/student_screen.dart';
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
  static const String adminStudent = '/admin_student';
  static const String adminStaff = '/admin_staff';
  static const String adminNotification = '/admin_notification';
  static const String adminEnquiryBox = '/admin_enquiry_box';
  static const String adminProgramme = '/admin_programme_booking';
  static const String adminSalary = '/admin_salary_management';
  static const String adminFees = '/admin_fees_management';
  

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
    adminStudent: (context) => StudentScreen(),
    adminStaff: (context) => StaffScreen(),
    adminNotification: (context) => AdminNotificationScreen(),
    adminEnquiryBox: (context) => EnquiryboxScreen(),
    adminProgramme: (context) => ProgrammeBookingScreen(),
    adminSalary: (context) => SalaryManagementScreen(),
    adminFees: (context) => FeesManagmentScreen(),
  };
}
