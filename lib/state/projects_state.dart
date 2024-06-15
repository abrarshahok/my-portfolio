import 'package:flutter/material.dart';

class ProjectsState extends ChangeNotifier {
  int currentIndex = 0;
  void changeIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
}
