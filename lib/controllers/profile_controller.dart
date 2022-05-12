import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_19022022/data/storage/token_storage.dart';
import 'package:project_19022022/views/login/login_page.dart';

class ProfileController extends ChangeNotifier {
  static final random = Random();

  static String randomPictureUrl() {
    final randomInt = random.nextInt(1000);
    return 'https://picsum.photos/seed/$randomInt/300/300';
  }

  void logout(BuildContext context) {
    TokenStorage().deleteToken();
    Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation,
          Animation secondaryAnimation) {
        return const LoginPage();
      }, transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      }),
      (Route route) => false,
    );
  }
}
