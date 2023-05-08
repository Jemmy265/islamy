import 'package:flutter/material.dart';

import 'Hadeth.dart';

class HadethtitleWidget extends StatelessWidget {
  Hadeth hadeth;

  HadethtitleWidget(this.hadeth);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        hadeth.title,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
