import 'package:flutter/cupertino.dart';

class LanguageProvider extends ChangeNotifier {
  String AppLanguage = "en";

  void changeLanguage(String lang) {
    if (AppLanguage == lang) {
      return;
    }
    AppLanguage = lang;
    notifyListeners();
  }
}
