import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  String currentLanguage = 'ar';

  void changeTheme(ThemeMode newMode) async {
    currentTheme = newMode;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
        'theme', currentTheme == ThemeMode.light ? 'light' : 'dark');
    notifyListeners();
  }

  String mainBackGroundImage() {
    return currentTheme == ThemeMode.light
        ? 'assets/images/background_image.png'
        : 'assets/images/background_dark_image.png';
  }

  bool isDark() {
    return currentTheme == ThemeMode.dark;
  }

  void changeLocale(String newLocale) async {
    currentLanguage = newLocale;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('language', currentLanguage);
    notifyListeners();
  }

  bool isArabic() {
    return currentLanguage == 'ar';
  }
}
