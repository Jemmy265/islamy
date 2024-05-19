import 'package:flutter/material.dart';
import 'package:islamy/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: () {
                provider.changeLanguage("en");
              },
              child: provider.languageCode == "en"
                  ? getSelectedWidget("English", context)
                  : getunSelectedWidget("English", context)),
          SizedBox(height: 12),
          InkWell(
              onTap: () {
                provider.changeLanguage("ar");
              },
              child: provider.languageCode == "ar"
                  ? getSelectedWidget("العربية", context)
                  : getunSelectedWidget("العربية", context)),
        ],
      ),
    );
  }

  Widget getSelectedWidget(String title, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Theme.of(context).hintColor),
        ),
        Icon(
          Icons.check,
          color: Theme.of(context).hintColor,
        )
      ],
    );
  }

  Widget getunSelectedWidget(String title, BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
