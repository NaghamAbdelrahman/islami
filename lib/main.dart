import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/hadeth_content/hadeth_content_screen.dart';
import 'package:islami/home/home_screen.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/providers/settings_provider.dart';
import 'package:islami/sura_content/sura_content_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (buildContext) => SettingsProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  late SettingsProvider settingsProvider;

  @override
  Widget build(BuildContext context) {
    settingsProvider = Provider.of<SettingsProvider>(context);
    initSharedPref();
    return MaterialApp(
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: settingsProvider.currentTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingsProvider.currentLanguage),
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SuraContentScreen.routeName: (_) => SuraContentScreen(),
        HadethContentScreen.routeName: (_) => HadethContentScreen(),
      },
      initialRoute: HomeScreen.routeName,
      debugShowCheckedModeBanner: false,
    );
  }

  initSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    String lang = prefs.getString('language') ?? 'ar';
    settingsProvider.changeLocale(lang);
    String? theme = prefs.getString('theme');
    if (theme == 'light') {
      settingsProvider.changeTheme(ThemeMode.light);
    } else if (theme == 'dark') {
      settingsProvider.changeTheme(ThemeMode.dark);
    }
  }
}
