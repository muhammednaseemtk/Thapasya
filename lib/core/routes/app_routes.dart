import 'package:Thapasya/features/splash/view/splash_screen.dart';
import 'package:flutter/widgets.dart';

class AppRoutes {
  static const String splash = '/splash';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => SplashScreen(),
  };
}