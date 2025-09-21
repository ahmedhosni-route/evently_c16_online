import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  String local = "en";

  void changeThemeMode(ThemeMode theme) {
    themeMode = theme;
    notifyListeners();
  }

  void changeLanguage(String lang){
    local = lang;
    notifyListeners();
  }

}
