import 'package:flutter/material.dart';
import 'package:islamy/ui/Hadith_details/hadith_details.dart';
import 'package:islamy/ui/Home/Home_Screen.dart';
import 'package:islamy/ui/My_theme_data.dart';
import 'package:islamy/ui/Splash/Splash_Screen.dart';
import 'package:islamy/ui/Sura_details/sura_details.dart';

void main() {
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashScreen.routeName,
      routes: {
        HomeScreen.routeName: (buildContext) => HomeScreen(),
        SplashScreen.routeName: (buildContext) => SplashScreen(),
        SuraDetailsScreen.routeName: (buildContext) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (buildContext) => HadethDetailsScreen(),
      },
      theme: Mythemedata.lightTheme,
      darkTheme: Mythemedata.darkTheme,
      themeMode: Mythemedata.themeMode,
    );
  }
}
