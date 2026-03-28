import 'package:flutter/material.dart';

class MainController with ChangeNotifier {

  int currentIndex = 0;

  void changeIndex(int index) {
    if (currentIndex == index) return; 
    currentIndex = index;
    notifyListeners();
  }
}