import 'package:flutter/material.dart';
import 'package:islami/home/home_screen.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/sura_content/sura_content_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyTheme.lightTheme,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SuraContentScreen.routeName: (_) => SuraContentScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
