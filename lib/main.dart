import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thapasya/core/routes/app_routes.dart';
import 'package:thapasya/features/auth/controller/login_tab_bar_controller.dart';
import 'package:thapasya/features/student/home/controller/main_controller.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainController()),
        ChangeNotifierProvider(create: (_) => LoginTabBarController()),
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
      initialRoute: AppRoutes.studentMain,
      routes: AppRoutes.routes,
    );
  }
}
