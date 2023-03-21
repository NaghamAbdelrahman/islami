import 'package:flutter/material.dart';
import 'package:islami/providers/settings_provider.dart';
import 'package:provider/provider.dart';

import '../home/hadeth/hadeth.dart';

class HadethContentScreen extends StatelessWidget {
  static const routeName = 'hadethContent';

  @override
  Widget build(BuildContext context) {
    Hadeth args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(settingsProvider.mainBackGroundImage()),
                fit: BoxFit.fill)),
        child: Scaffold(
          appBar: AppBar(
            title: Text(args.tittle),
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Card(
                elevation: 5,
                margin:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Text(args.Content,
                        textDirection: TextDirection.rtl,
                        style: Theme.of(context).textTheme.headline6),
                  ),
                )),
          ),
        ));
  }
}
