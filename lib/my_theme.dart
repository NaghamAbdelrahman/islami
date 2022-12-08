import 'package:flutter/material.dart';

class MyTheme {
  static const lightPrimary = Color(0xFFB7935F);
  static const darkPrimary = Color(0xFF141A2E);
  static const yellow = Color(0xFFFACC1D);
  static final ThemeData lightTheme = ThemeData(
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12)))),
    textTheme: const TextTheme(
      headline4: TextStyle(fontSize: 28, color: Colors.black),
      headline6: TextStyle(fontSize: 22, color: Colors.black),
      subtitle2: TextStyle(fontSize: 14, color: Colors.black),
    ),
    accentColor: lightPrimary,
    primaryColor: lightPrimary,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        color: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        backgroundColor: lightPrimary,
        selectedIconTheme: IconThemeData(size: 36),
        unselectedIconTheme: IconThemeData(size: 24),
        selectedLabelStyle: TextStyle(fontSize: 12),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white),
  );
  static final ThemeData darkTheme = ThemeData(
    cardColor: darkPrimary,
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: darkPrimary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12)))),
    textTheme: const TextTheme(
      headline4: TextStyle(fontSize: 28, color: Colors.white),
      headline6: TextStyle(fontSize: 22, color: Colors.white),
      subtitle2: TextStyle(fontSize: 14, color: Colors.white),
    ),
    accentColor: yellow,
    primaryColor: darkPrimary,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        color: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        backgroundColor: darkPrimary,
        selectedIconTheme: IconThemeData(size: 36),
        unselectedIconTheme: IconThemeData(size: 24),
        selectedLabelStyle: TextStyle(fontSize: 12),
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white),
  );
}
