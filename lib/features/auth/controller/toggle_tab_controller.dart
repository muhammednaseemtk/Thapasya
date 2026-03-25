import 'package:flutter/material.dart';

class ToggleTabController extends ChangeNotifier {
  int selectedIndex = 0;

  void changeTab(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}