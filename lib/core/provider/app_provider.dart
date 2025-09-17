import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  void changeThemeMode(ThemeMode theme) {
    themeMode = theme;
    notifyListeners();
  }

}
