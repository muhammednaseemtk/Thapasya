import 'package:Thapasya/core/routes/app_routes.dart';
import 'package:Thapasya/features/student/home/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => MainController()),
  ], child: ThapasyaApp()));
}

class ThapasyaApp extends StatelessWidget {
  const ThapasyaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.main,
      routes: AppRoutes.routes,
    );
  }
}
