import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../providers/settings_provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                settingsProvider.changeLocale(const Locale('ar'));
              },
              child: settingsProvider.isArabic()
                  ? selectedItem(AppLocalizations.of(context)!.arabic)
                  : unSelectedItem(AppLocalizations.of(context)!.arabic)),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          InkWell(
              onTap: () {
                settingsProvider.changeLocale(const Locale('en'));
              },
              child: settingsProvider.isArabic()
                  ? unSelectedItem(AppLocalizations.of(context)!.english)
                  : selectedItem(AppLocalizations.of(context)!.english)),
        ],
      ),
    );
  }

  Widget selectedItem(String tittle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          tittle,
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(color: Theme.of(context).accentColor),
        ),
        Icon(
          Icons.check,
          color: Theme.of(context).accentColor,
        ),
      ],
    );
  }

  Widget unSelectedItem(String tittle) {
    return Text(
      tittle,
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
