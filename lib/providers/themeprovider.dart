import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode appTheme = ThemeMode.dark;

  void changeTheme(ThemeMode newthemeMode) {
    if (appTheme == newthemeMode) {
      return;
    }
    appTheme = newthemeMode;
    notifyListeners();
  }

  bool isDark() {
    return appTheme == ThemeMode.dark;
  }
}
