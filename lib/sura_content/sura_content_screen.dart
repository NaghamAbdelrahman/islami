import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/providers/settings_provider.dart';
import 'package:islami/sura_content/sura_content_arguments.dart';
import 'package:islami/sura_content/sura_style_widget.dart';
import 'package:provider/provider.dart';

class SuraContentScreen extends StatefulWidget {
  static const routeName = 'suraContent';

  @override
  State<SuraContentScreen> createState() => _SuraContentScreenState();
}

class _SuraContentScreenState extends State<SuraContentScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    SuraDetailsArguments args =
        ModalRoute.of(context)?.settings.arguments as SuraDetailsArguments;
    if (verses.isEmpty) readFile(args.index + 1);
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
          body: Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: verses.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).accentColor,
                    ),
                  )
                : ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (_, index) {
                      return SuraStyleWidget(verses[index], index + 1);
                    },
                    itemCount: verses.length,
                    separatorBuilder: (_, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 50),
                        height: 1,
                        color: Theme.of(context).accentColor,
                      );
                    },
                  ),
          ),
        ));
  }

  void readFile(int fileIndex) async {
    String fileContent =
        await rootBundle.loadString('assets/files/$fileIndex.txt');
    List<String> lines = fileContent.trim().split('\n');
    setState(() {
      verses = lines;
    });
  }
}
