import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_19022022/controllers/profile_controller.dart';
import 'package:project_19022022/shared/app_colors.dart';
import 'package:project_19022022/shared/app_constants.dart';

final profileNotifierProvider =
    ChangeNotifierProvider<ProfileController>((ref) {
  return ProfileController();
});

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileChangeNotifier = ref.watch(profileNotifierProvider);
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
      body: Stack(children: [
        Align(
          child: Column(
            children: [
              const SizedBox(height: 10),
              CircleAvatar(
                radius: 60,
                backgroundImage:
                    NetworkImage(ProfileController.randomPictureUrl()),
              ),
              const SizedBox(height: 5),
              Text(
                'Phat Nguyen',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 5),
              Text(
                'dev.phatnv@gmail.com',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.grey[600],
                    ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 30,
          left: AppConstants.kPadding,
          right: AppConstants.kPadding,
          child: MaterialButton(
            onPressed: () => profileChangeNotifier.logout(context),
            child: const Text(
              'Logout',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            color: Colors.orange,
          ),
        ),
      ]),
    );
  }
}
