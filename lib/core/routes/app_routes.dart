import 'package:Thapasya/features/auth/view/login_screen.dart';
import 'package:Thapasya/features/student/home/view/home_screen.dart';
import 'package:Thapasya/features/splash/view/splash_screen.dart';
import 'package:Thapasya/features/student/home/widget/main_screen.dart';
import 'package:flutter/widgets.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String main = '/main';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => SplashScreen(),
    login: (context) => LoginScreen(),
    home: (context) => HomeScreen(),
    main: (context) => MainScreen(),
  };
}