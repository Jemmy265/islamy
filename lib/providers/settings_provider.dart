import 'package:flutter/material.dart';
import 'package:islamy/Shared_Prefs/Shared_Prefs.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String languageCode = "en";

  void init() {
    String myTheme = SharedPrefs.getTheme();
    if (myTheme == "light") {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }
    languageCode = SharedPrefs.getLanguage();
  }

  void changeLanguage(String newLangCode) {
    languageCode = newLangCode;
    SharedPrefs.setLanguage(newLangCode);
    notifyListeners();
  }

  void enableDarkMode() {
    themeMode = ThemeMode.dark;
    SharedPrefs.setTheme("dark");
    notifyListeners();
  }

  void enableLightMode() {
    themeMode = ThemeMode.light;
    SharedPrefs.setTheme("light");
    notifyListeners();
  }

  String getBackgroundImage() {
    return themeMode == ThemeMode.light
        ? 'assets/images/default_bg.png'
        : 'assets/images/dark_bg.png';
  }

  bool isDarkEnabled() {
    return themeMode == ThemeMode.dark;
  }
}
