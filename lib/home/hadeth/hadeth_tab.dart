import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/home/hadeth/hadeth.dart';
import 'package:islami/home/hadeth/hadeth_tittle_widget.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> allHadethList = [];

  @override
  Widget build(BuildContext context) {
    if (allHadethList.isEmpty) readHadethFile();
    return Column(
      children: [
        Expanded(flex: 3, child: Image.asset('assets/images/hadeth_logo.png')),
        Expanded(
          flex: 7,
          child: allHadethList.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).accentColor,
                  ),
                )
              : ListView.separated(
                  physics: BouncingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 65),
                      height: 1,
                      color: Theme.of(context).accentColor,
                    );
                  },
                  itemBuilder: (_, index) {
                    return HadethTittleWidget(allHadethList[index]);
                  },
                  itemCount: allHadethList.length,
                ),
        ),
      ],
    );
  }

  void readHadethFile() async {
    List<Hadeth> hadethListContent = [];
    String content = await rootBundle.loadString('assets/files/ahadeth .txt');
    List<String> allHadethContent = content.split('#');
    for (int i = 0; i < allHadethContent.length; i++) {
      String singleHadeth = allHadethContent[i];
      List<String> singleHadethLines = singleHadeth.trim().split('\n');
      String tittle = singleHadethLines[0];
      singleHadethLines.removeAt(0);
      String content = singleHadethLines.join('\n');
      Hadeth h = Hadeth(tittle, content);
      hadethListContent.add(h);
    }
    setState(() {
      allHadethList = hadethListContent;
    });
  }
}
