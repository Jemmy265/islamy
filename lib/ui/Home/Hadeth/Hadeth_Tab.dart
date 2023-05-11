import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/ui/Home/Hadeth/Hadeth.dart';
import 'package:islamy/ui/Home/Hadeth/Hadeth_title.dart';

class HadethTeb extends StatefulWidget {
  @override
  State<HadethTeb> createState() => _HadethTebState();
}

class _HadethTebState extends State<HadethTeb> {
  List<Hadeth> allHadethList = [];

  @override
  Widget build(BuildContext context) {
    if (allHadethList.isEmpty) {
      readHadethFile();
    }
    return Column(
      children: [
        Expanded(flex: 1, child: Image.asset("assets/images/hadeth_logo.png")),
        Container(
          width: double.infinity,
          height: 2,
          color: Theme.of(context).accentColor,
          margin: EdgeInsets.only(bottom: 4),
        ),
        Text(
          AppLocalizations.of(context)!.hadeth_number,
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        Container(
          width: double.infinity,
          height: 2,
          color: Theme.of(context).accentColor,
          margin: EdgeInsets.only(top: 4),
        ),
        Expanded(
            flex: 3,
            child: Container(
                child: allHadethList.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.separated(
                        itemBuilder: (buildContext, index) {
                          return HadethtitleWidget(allHadethList[index]);
                        },
                        itemCount: allHadethList.length,
                        separatorBuilder: (buildContext, index) {
                          return Container(
                            color: Theme.of(context).accentColor,
                            width: double.infinity,
                            height: 1,
                            margin: EdgeInsets.symmetric(horizontal: 24),
                          );
                        },
                      )))
      ],
    );
  }

  void readHadethFile() async {
    List<Hadeth> hadethList = [];
    String fileContent =
        await rootBundle.loadString("assets/Files/ahadeth .txt");
    List<String> splittedContent = fileContent.split('#');
    for (int i = 0; i < splittedContent.length; i++) {
      String singleHadethContent = splittedContent[i];
      List<String> lines = singleHadethContent.trim().split("\n");
      String title = lines[0];
      lines.removeAt(0);
      String content = lines.join("\n");
      Hadeth hadeth = Hadeth(title, content);
      hadethList.add(hadeth);
    }
    await Future.delayed(Duration(seconds: 4));
    allHadethList = hadethList;
    setState(() {});
  }
}
