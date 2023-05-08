import 'package:flutter/material.dart';

class Mythemedata {
  static const Color lightPrimaryColor = Color(0xFFB7935F);
  static const Color darkPrimaryColor = Color(0xFF141A2E);
  static const Color lightMainTextColor = Color(0xFF242424);
  static const Color darkMainTextColor = Color(0xFFF8F8F8);
  static const Color darkAccentColor = Color(0xFFFACC1D);

  static var lightTheme = ThemeData(
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(lightPrimaryColor))),
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: lightPrimaryColor),
      cardColor: Colors.white,
      primaryColor: lightPrimaryColor,
      accentColor: lightPrimaryColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: lightMainTextColor,
            fontSize: 30,
          ),
          iconTheme: IconThemeData(color: Colors.black)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: lightPrimaryColor,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white),
      textTheme: const TextTheme(
        headline3: TextStyle(
          // screen title
          color: lightMainTextColor,
          fontSize: 32,
        ),
        headline5: TextStyle(
          // sub headers
          color: lightMainTextColor,
          fontSize: 24,
        ),
        bodyText1: TextStyle(
          fontSize: 24,
          color: lightMainTextColor,
        ),
        bodyText2: TextStyle(
          fontSize: 20,
          color: lightMainTextColor,
        ),
      ));
  static var darkTheme = ThemeData(
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(darkPrimaryColor))),
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: darkAccentColor),
      cardColor: darkPrimaryColor,
      primaryColor: darkPrimaryColor,
      accentColor: darkAccentColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: darkMainTextColor,
            fontSize: 30,
          ),
          iconTheme: IconThemeData(color: Colors.white)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: darkPrimaryColor,
          selectedItemColor: darkAccentColor,
          unselectedItemColor: Colors.white),
      textTheme: const TextTheme(
        headline3: TextStyle(
          // screen title
          color: darkMainTextColor,
          fontSize: 32,
        ),
        headline5: TextStyle(
          // sub headers
          color: darkMainTextColor,
          fontSize: 24,
        ),
        bodyText1: TextStyle(
          fontSize: 24,
          color: darkMainTextColor,
        ),
        bodyText2: TextStyle(
          fontSize: 20,
          color: darkMainTextColor,
        ),
      ));

  static ThemeMode themeMode = ThemeMode.dark;
}
