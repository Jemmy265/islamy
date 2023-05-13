import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
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
                provider.enableLightMode();
              },
              child: provider.isDarkEnabled()
                  ? getunSelectedWidget(
                      AppLocalizations.of(context)!.light, context)
                  : getSelectedWidget(
                      AppLocalizations.of(context)!.light, context)),
          SizedBox(height: 12),
          InkWell(
            onTap: () {
              provider.enableDarkMode();
            },
            child: provider.isDarkEnabled()
                ? getSelectedWidget(AppLocalizations.of(context)!.dark, context)
                : getunSelectedWidget(
                    AppLocalizations.of(context)!.dark, context),
          ),
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
              ?.copyWith(color: Theme.of(context).accentColor),
        ),
        Icon(
          Icons.check,
          color: Theme.of(context).accentColor,
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
