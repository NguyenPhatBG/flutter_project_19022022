import 'package:flutter/material.dart';
import 'package:project_19022022/views/home/widgets/home_module.dart';
import 'package:project_19022022/views/profile/profile_page.dart';

class HomeController extends ChangeNotifier {
  int selectedIndex = 0;

  static const List<Widget> widgetOptions = [
    HomeModule(),
    ProfilePage(),
  ];

  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
