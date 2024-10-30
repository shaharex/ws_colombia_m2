import 'package:flutter/material.dart';
import 'package:ws_colombia_m2/pages/auth/login_page.dart';
import 'package:ws_colombia_m2/pages/home/home_page.dart';
import 'package:ws_colombia_m2/pages/splash/splash_page.dart';
import 'package:ws_colombia_m2/theme/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.white,
        ),
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
  }
}
