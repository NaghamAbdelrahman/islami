import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset('assets/images/radio_logo.png'),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        Text(AppLocalizations.of(context)!.quranRadio,
            style: Theme.of(context).textTheme.headline4),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.08,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.skip_previous,
                size: MediaQuery.of(context).size.height * 0.05,
              ),
              color: Theme.of(context).accentColor,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.play_arrow,
                size: MediaQuery.of(context).size.height * 0.07,
              ),
              color: Theme.of(context).accentColor,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.skip_next,
                size: MediaQuery.of(context).size.height * 0.05,
              ),
              color: Theme.of(context).accentColor,
            ),
          ],
        )
      ]),
    );
  }
}
