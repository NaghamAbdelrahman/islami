import 'package:flutter/material.dart';
import 'package:islami/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double angle = 0;
  int counter = 0;
  List<String> azkar = [
    'سبحان الله',
    'الله أكبر',
    'الحمد لله ',
    'لا إله إلا الله'
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.39,
              child: Stack(
                children: [
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.03,
                    left: MediaQuery.of(context).size.width * 0.46,
                    child: Image.asset(
                        settingsProvider.currentTheme == ThemeMode.light
                            ? 'assets/images/head _of_ seb7a.png'
                            : 'assets/images/head_of_sebha_dark.png'),
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Positioned(
                      top: MediaQuery.of(context).size.height * 0.1,
                      left: MediaQuery.of(context).size.width * 0.2,
                      child: InkWell(
                          onTap: () {
                            click();
                          },
                          child: Transform.rotate(
                            angle: angle,
                            child: Image.asset(
                              settingsProvider.currentTheme == ThemeMode.light
                                  ? 'assets/images/body _of_ seb7a.png'
                                  : 'assets/images/body_of_sebha_dark.png',
                              height: MediaQuery.of(context).size.height * 0.28,
                            ),
                          ))),
                ],
              ),
            ),
            Text(
              'عدد التسبيحات',
              style: Theme.of(context).textTheme.headline4,
            ),
            Container(
                alignment: Alignment.center,
                width: 69,
                height: 81,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  '$counter',
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Container(
                alignment: Alignment.center,
                width: 160,
                height: 70,
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  '${azkar[currentIndex]}',
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: settingsProvider.currentTheme == ThemeMode.light
                          ? Colors.white
                          : Colors.black),
                )),
          ],
        ));
  }

  void click() {
    angle++;
    counter++;
    if (counter == 34) {
      currentIndex++;
      counter = 0;
    }
    if (currentIndex > azkar.length - 1) {
      currentIndex = 0;
    }
    setState(() {});
  }
}
