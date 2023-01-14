import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  Locale currentLanguage = Locale('ar');

  void changeTheme(ThemeMode newMode) {
    currentTheme = newMode;
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

  void changeLocale(Locale newLocale) {
    currentLanguage = newLocale;
    notifyListeners();
  }

  bool isArabic() {
    return currentLanguage == Locale('ar');
  }
}
