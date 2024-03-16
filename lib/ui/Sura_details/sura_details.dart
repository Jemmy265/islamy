import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/ui/Sura_details/Verse_content.dart';
import 'package:provider/provider.dart';

import '../../providers/settings_provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "Sura-Details";

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> chaptercontent = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    var args =
        ModalRoute.of(context)?.settings.arguments as SuraDetailsScreenArgs;
    if (chaptercontent.isEmpty) {
      readfile(args.index);
    }
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(provider.getBackgroundImage()),
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
                    color: Theme.of(context).primaryColor,
                    elevation: 24,
                    margin: EdgeInsets.symmetric(vertical: 48, horizontal: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: chaptercontent.isEmpty
                        ? Center(child: CircularProgressIndicator())
                        : ListView.separated(
                            itemBuilder: (buildContext, index) {
                              return VerseContent(chaptercontent[index]);
                            },
                      itemCount: chaptercontent.length,
                      separatorBuilder: (buildContext, index) {
                        return Container(
                          color: Theme.of(context).hintColor,
                                width: double.infinity,
                                height: 1,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 64, vertical: 12),
                              );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void readfile(int ChapterIndex) async {
    await Future.delayed(Duration(seconds: 1));
    String text =
        await rootBundle.loadString("assets/Files/${ChapterIndex + 1}.txt");
    chaptercontent = text.split('\n');
    setState(() {});
  }
}

class SuraDetailsScreenArgs {
  String title;
  int index;

  SuraDetailsScreenArgs({required this.title, required this.index});
}
