import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_19022022/shared/app_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static final random = Random();

  static String randomPictureUrl() {
    final randomInt = random.nextInt(1000);
    return 'https://picsum.photos/seed/$randomInt/300/300';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Align(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(randomPictureUrl()),
              ),
              const SizedBox(height: 5),
              Text(
                'Phat Nguyen',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 5),
              Text('dev.phatnv@gmail.com', style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.grey[600],
                    ),)
            ],
          ),
        ),
      ),
    );
  }
}
