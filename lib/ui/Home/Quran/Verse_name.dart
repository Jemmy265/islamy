import 'package:flutter/material.dart';
import 'package:islamy/ui/Sura_details/sura_details.dart';

class VersenameWidget extends StatelessWidget {
  String title;
  int index;

  VersenameWidget({required this.title, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          SuraDetailsScreen.routeName,
          arguments: SuraDetailsScreenArgs(title: title, index: index),
        );
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
