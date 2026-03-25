import 'package:flutter/material.dart';

class LoginTabBarController with ChangeNotifier {
  
  int selectedIndex = 0;

  void changeTab(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}