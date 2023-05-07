import 'package:flutter/material.dart';
import 'package:islamy/ui/Hadith_details/hadith_details.dart';

import 'Hadeth.dart';

class HadethtitleWidget extends StatelessWidget {
  Hadeth hadeth;

  HadethtitleWidget(this.hadeth);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethDetailsScreen.routeName,
            arguments: hadeth);
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(
          hadeth.title,
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
