import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences prefs;

  static Future<void> setTheme(String theme) async {
    await prefs.setString("theme", theme);
  }

  static String getTheme() {
    return prefs.getString("theme") ?? "light";
  }

  static Future<void> setLanguage(String languageCode) async {
    await prefs.setString("language", languageCode);
  }

  static String getLanguage() {
    return prefs.getString("language") ?? "en";
  }
}
