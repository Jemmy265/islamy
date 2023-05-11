import 'package:flutter/material.dart';
import 'package:islamy/ui/Home/Hadeth/Hadeth.dart';

import '../My_theme_data.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = "Hadeth-Details";

  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Mythemedata.themeMode == ThemeMode.light
                ? 'assets/images/default_bg.png'
                : 'assets/images/dark_bg.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text(args.title),
          ),
          body: Column(
            children: [
              Container(
                child: Expanded(
                  child: Card(
                    elevation: 24,
                    margin: EdgeInsets.symmetric(vertical: 48, horizontal: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: SingleChildScrollView(
                      child: Text(
                        args.content,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
