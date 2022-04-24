import 'package:flutter/material.dart';
import 'package:project_19022022/shared/app_colors.dart';

class HomeModule extends StatelessWidget {
  const HomeModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text('Home'),
      ),
    );
  }
}
