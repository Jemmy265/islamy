import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islamy/Shared_Prefs/Shared_Prefs.dart';
import 'package:islamy/providers/settings_provider.dart';
import 'package:islamy/ui/Hadith_details/hadith_details.dart';
import 'package:islamy/ui/Home/Home_Screen.dart';
import 'package:islamy/ui/My_theme_data.dart';
import 'package:islamy/ui/Splash/Splash_Screen.dart';
import 'package:islamy/ui/Sura_details/sura_details.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefs.prefs = await SharedPreferences.getInstance();
  runApp(ChangeNotifierProvider(
      create: (buildContext) => SettingsProvider()..init(),
      child: MyApplication()));
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        HomeScreen.routeName: (buildContext) => HomeScreen(),
        SplashScreen.routeName: (buildContext) => SplashScreen(),
        SuraDetailsScreen.routeName: (buildContext) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (buildContext) => HadethDetailsScreen(),
      },
      theme: Mythemedata.lightTheme,
      darkTheme: Mythemedata.darkTheme,
      themeMode: provider.themeMode,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      locale: Locale(provider.languageCode),
    );
  }
}
