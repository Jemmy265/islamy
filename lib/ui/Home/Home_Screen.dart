import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/providers/settings_provider.dart';
import 'package:islamy/ui/Home/Hadeth/Hadeth_Tab.dart';
import 'package:islamy/ui/Home/Quran/Quran_Tab.dart';
import 'package:islamy/ui/Home/Settings/SettingsTab.dart';
import 'package:islamy/ui/Home/Tasbeh/Tasbeh_Tab.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int SelectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(provider.getBackgroundImage()),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.app_title),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: SelectedTabIndex,
            onTap: (index) {
              setState(() {
                SelectedTabIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  icon: ImageIcon(AssetImage("assets/images/icon_quran.png")),
                  label: AppLocalizations.of(context)!.quran),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  icon: ImageIcon(AssetImage("assets/images/icon_hadeth.png")),
                  label: AppLocalizations.of(context)!.hadith),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  icon: ImageIcon(AssetImage("assets/images/icon_sebha.png")),
                  label: AppLocalizations.of(context)!.tasbeh),
              // BottomNavigationBarItem(
              //     backgroundColor: Theme.of(context).primaryColor,
              //     icon: ImageIcon(AssetImage("assets/images/zakah_icon.png")),
              //     label: AppLocalizations.of(context)!.zakah),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  icon: Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.settings),
            ]),
        body: tabs[SelectedTabIndex],
      ),
    );
  }

  List<Widget> tabs = [
    QuranTeb(),
    HadethTeb(),
    TasbehTeb(),
    // ZakahTab(),
    settingstab(),
  ];
}
