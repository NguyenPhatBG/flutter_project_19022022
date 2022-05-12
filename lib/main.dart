import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:project_19022022/models/environment.dart';
import 'package:project_19022022/shared/app_colors.dart';
import 'package:project_19022022/views/home/home_page.dart';
import 'package:project_19022022/views/home/user_detail.dart';
import 'package:project_19022022/views/login/login_page.dart';
import 'package:project_19022022/views/profile/profile_page.dart';
import 'package:project_19022022/views/register/register_page.dart';
import 'package:project_19022022/views/start/start_page.dart';

Future<void> main() async {
  await dotenv.load(fileName: Environment.fileName);
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
  ));
  runApp(const ProviderScope(child: MyApp()));
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
      initialRoute: '/start',
      routes: {
        '/start': (context) => const StartPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
        '/user_detail': (context) => const UserDetail(),
      },
    );
  }
}
