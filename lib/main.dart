import 'package:flutter/material.dart';
import 'package:islamy/ui/Home/Home_Screen.dart';
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
      },
      theme: ThemeData(
          progressIndicatorTheme:
              ProgressIndicatorThemeData(color: Color(0xFFB7935F)),
          cardColor: Colors.white,
          primaryColor: Color(0xFFB7935F),
          scaffoldBackgroundColor: Colors.transparent,
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
              titleTextStyle: TextStyle(
                color: Color(0xFF242424),
                fontSize: 30,
              ),
              iconTheme: IconThemeData(color: Colors.black)),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Color(0xFFB7935F),
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.white)),
    );
  }
}
