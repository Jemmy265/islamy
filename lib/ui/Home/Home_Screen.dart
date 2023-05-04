import 'package:flutter/material.dart';
import 'package:islamy/ui/Home/Hadeth/Hadeth_Tab.dart';
import 'package:islamy/ui/Home/Quran/Quran_Tab.dart';
import 'package:islamy/ui/Home/Radio/Radio_Tab.dart';
import 'package:islamy/ui/Home/Tasbeh/Tasbeh_Tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int SelectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/default_bg.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Islamy"),
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
                  label: "Quran"),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  icon: ImageIcon(AssetImage("assets/images/icon_hadeth.png")),
                  label: "Hadeth"),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  icon: ImageIcon(AssetImage("assets/images/icon_sebha.png")),
                  label: "Tasbeh"),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  icon: ImageIcon(AssetImage("assets/images/icon_radio.png")),
                  label: "Radio"),
            ]),
        body: tabs[SelectedTabIndex],
      ),
    );
  }

  List<Widget> tabs = [
    QuranTeb(),
    HadethTeb(),
    TasbehTeb(),
    RadioTeb(),
  ];
}
