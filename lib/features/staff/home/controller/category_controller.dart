import 'package:flutter/material.dart';

class CategoryController extends ChangeNotifier {
  int selectedIndex = 0;

  void selectIndex(int index) {
    selectedIndex = index;
    notifyListeners(); 
  }
}