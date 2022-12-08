import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/home/settings/theme_bottom_sheet_localization.dart';
import 'package:islami/home/settings/theme_bottom_sheet_theme.dart';
import 'package:islami/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          InkWell(
            onTap: () {
              showThemeBottomSheetTheme();
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).accentColor),
                  borderRadius: BorderRadius.circular(18)),
              child: Text(
                settingsProvider.currentTheme == ThemeMode.light
                    ? AppLocalizations.of(context)!.light
                    : AppLocalizations.of(context)!.dark,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          InkWell(
            onTap: () {
              showThemeBottomSheetLocale();
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).accentColor),
                  borderRadius: BorderRadius.circular(18)),
              child: Text(
                settingsProvider.currentLanguage == Locale('ar')
                    ? AppLocalizations.of(context)!.arabic
                    : AppLocalizations.of(context)!.english,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showThemeBottomSheetTheme() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return ThemeBottomSheetTheme();
        });
  }

  void showThemeBottomSheetLocale() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return ThemeBottomSheetLocale();
        });
  }
}
