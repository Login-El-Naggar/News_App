import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api/api_manager.dart';
import '../l10n/app_localizations.dart';
import '../providers/themeprovider.dart';
import '../utils/AppStyles.dart';

class MainErrorWidget extends StatefulWidget {
  VoidCallback onPressed;

  MainErrorWidget({super.key, required this.onPressed});

  @override
  State<MainErrorWidget> createState() => _MainErrorWidgetState();
}

class _MainErrorWidgetState extends State<MainErrorWidget> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Center(
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.someThingWentWrong,
            style: themeProvider.isDark()
                ? AppStyles.medium20white
                : AppStyles.bold24black,
          ),
          ElevatedButton(
            onPressed: () {
              widget.onPressed();
              setState(() {});
            },
            child: Text(
              AppLocalizations.of(context)!.tryAgain,
              style: themeProvider.isDark()
                  ? AppStyles.medium20white
                  : AppStyles.bold24black,
            ),
          ),
        ],
      ),
    );
  }
}
