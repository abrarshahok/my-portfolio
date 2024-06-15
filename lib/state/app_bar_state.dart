// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter/material.dart';

class AppBarStateProvider extends ChangeNotifier {
  String currentPath = '/';

  void setPath(String? path, {bool build = true}) {
    path ??= '/';
    if (currentPath != path) {
      currentPath = path;
      html.window.history.pushState(null, '', path);
      if (build) {
        notifyListeners();
      }
    }
  }
}
