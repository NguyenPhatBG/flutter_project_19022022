import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:project_19022022/models/environment.dart';
import 'package:project_19022022/shared/app_colors.dart';
import 'package:project_19022022/views/home/home_page.dart';
import 'package:project_19022022/views/login/login_page.dart';
import 'package:project_19022022/views/profile/profile_page.dart';
import 'package:project_19022022/views/register/register_page.dart';

Future<void> main() async {
  await dotenv.load(fileName: Environment.fileName);
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
  ));
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
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.secondary.withOpacity(0.5),
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.secondary),
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.secondary),
          ),
          labelStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.white,
                fontSize: 20,
              ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          hintStyle: TextStyle(
            color: AppColors.secondary.withOpacity(0.3),
            fontSize: 15,
          ),
        ),
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
