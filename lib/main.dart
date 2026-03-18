import 'package:Thapasya/core/routes/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ThapasyaApp());
}

class ThapasyaApp extends StatelessWidget {
  const ThapasyaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
    );
  }
}
