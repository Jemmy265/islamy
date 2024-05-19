import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/settings_provider.dart';
import '../Login/login_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'Splash';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, LoginScreen.routename);
    });
    return Scaffold(
      body: Container(
        child: Image.asset(
          provider.themeMode == ThemeMode.light
              ? "assets/images/splash.png"
              : "assets/images/dark_Splash_background.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
