import 'package:flutter/material.dart';

import '../../sura_content/sura_content_arguments.dart';
import '../../sura_content/sura_content_screen.dart';

class SuraTittle extends StatelessWidget {
  String tittle;
  int index;

  SuraTittle(this.tittle, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraContentScreen.routeName,
            arguments: SuraDetailsArguments(tittle, index));
      },
      child: Text(
        tittle,
        textAlign: TextAlign.center,
        style: (Theme.of(context).textTheme.headline4),
      ),
    );
  }
}
