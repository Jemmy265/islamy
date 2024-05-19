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
      hintColor: lightPrimaryColor,
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
        displaySmall: TextStyle(
          // screen title
          color: lightMainTextColor,
          fontSize: 32,
        ),
        headlineSmall: TextStyle(
          // sub headers
          color: lightMainTextColor,
          fontSize: 24,
        ),
        bodyLarge: TextStyle(
          fontSize: 24,
          color: lightMainTextColor,
        ),
        bodyMedium: TextStyle(
          fontSize: 20,
          color: lightMainTextColor,
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          )));
  static var darkTheme = ThemeData(
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(darkPrimaryColor))),
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: darkAccentColor),
      cardColor: darkPrimaryColor,
      primaryColor: darkPrimaryColor,
      hintColor: darkAccentColor,
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
        displaySmall: TextStyle(
          // screen title
          color: darkMainTextColor,
          fontSize: 32,
        ),
        headlineSmall: TextStyle(
          // sub headers
          color: darkMainTextColor,
          fontSize: 24,
        ),
        bodyLarge: TextStyle(
          fontSize: 24,
          color: darkMainTextColor,
        ),
        bodyMedium: TextStyle(
          fontSize: 20,
          color: darkMainTextColor,
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: darkPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          )));
}
