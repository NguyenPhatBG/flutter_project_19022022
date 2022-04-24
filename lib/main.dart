import 'package:flutter/material.dart';
import 'package:project_19022022/shared/app_colors.dart';

import 'package:project_19022022/views/home/home_page.dart';
import 'package:project_19022022/views/login/login_page.dart';
import 'package:project_19022022/views/profile/profile_page.dart';
import 'package:project_19022022/views/register/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 19022022',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        primaryColor: AppColors.primary,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}
