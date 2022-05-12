import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:project_19022022/controllers/home_controller.dart';

final homeNotifierProvider = ChangeNotifierProvider<HomeController>((ref) {
  return HomeController();
});

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeChangeNotifier = ref.watch(homeNotifierProvider);
    return Scaffold(
      body: HomeController.widgetOptions
          .elementAt(homeChangeNotifier.selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: homeChangeNotifier.selectedIndex,
        onTap: homeChangeNotifier.onItemTapped,
        elevation: 5,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Account',
            icon: Icon(Icons.person),
          )
        ],
      ),
    );
  }
}
