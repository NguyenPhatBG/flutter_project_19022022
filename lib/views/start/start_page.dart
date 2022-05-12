import 'package:flutter/material.dart';
import 'package:project_19022022/data/storage/token_storage.dart';
import 'package:project_19022022/shared/app_colors.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void didChangeDependencies() async {
    Future.delayed(const Duration(milliseconds: 1000), () async {
      await TokenStorage().getToken().then((token) {
        if (token != null) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            '/home',
            (Route<dynamic> route) => false,
          );
        } else {
          Navigator.of(context).pushNamedAndRemoveUntil(
            '/login',
            (Route<dynamic> route) => false,
          );
        }
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              'Loading...',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
