import 'package:flutter/material.dart';
import 'package:islami/hadeth_content/hadeth_content_screen.dart';

import 'hadeth.dart';

class HadethTittleWidget extends StatelessWidget {
  Hadeth hadeth;

  HadethTittleWidget(this.hadeth);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethContentScreen.routeName,
            arguments: Hadeth(hadeth.tittle, hadeth.Content));
      },
      child: Text(
        hadeth.tittle,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
