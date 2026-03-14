import 'package:Thapasya/features/auth/view/login_screen.dart';
import 'package:Thapasya/features/splash/view/splash_screen.dart';
import 'package:flutter/widgets.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => SplashScreen(),
    login: (context) => LoginScreen(),
  };
}