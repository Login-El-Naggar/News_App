import 'package:flutter/cupertino.dart';
import 'package:news_app/providers/themeprovider.dart';

import '../../../l10n/app_localizations.dart';
import '../../../utils/AppAssets.dart';

class HomeCategoryModel {
  String id;
  String image;
  String title;

  HomeCategoryModel({
    required this.id,
    required this.image,
    required this.title,
  });

  static List<HomeCategoryModel> homeCategoryList({
    required ThemeProvider ThemeProvider,
    required BuildContext context,
  }) {
    return [
      HomeCategoryModel(
        id: "general",
        image: ThemeProvider.isDark()
            ? AppAssets.lightGeneral
            : AppAssets.darkGeneral,
        title: AppLocalizations.of(context)!.general,
      ),
      HomeCategoryModel(
        id: "business",
        image: ThemeProvider.isDark()
            ? AppAssets.lightBuissness
            : AppAssets.darkBuissness,
        title: AppLocalizations.of(context)!.business,
      ),
      HomeCategoryModel(
        id: "sports",
        image: ThemeProvider.isDark()
            ? AppAssets.lightSport
            : AppAssets.darkSport,
        title: AppLocalizations.of(context)!.sports,
      ),
      HomeCategoryModel(
        id: "technology",
        image: ThemeProvider.isDark()
            ? AppAssets.lightTechnology
            : AppAssets.darkTechnology,
        title: AppLocalizations.of(context)!.technology,
      ),
      HomeCategoryModel(
        id: "science",
        image: ThemeProvider.isDark()
            ? AppAssets.lightScience
            : AppAssets.darkScience,
        title: AppLocalizations.of(context)!.science,
      ),
      HomeCategoryModel(
        id: "health",
        image: ThemeProvider.isDark()
            ? AppAssets.lightHealth
            : AppAssets.darkHealth,
        title: AppLocalizations.of(context)!.health,
      ),
      HomeCategoryModel(
        id: "entertainment",
        image: ThemeProvider.isDark()
            ? AppAssets.lightEntertainment
            : AppAssets.darkEntertainment,
        title: AppLocalizations.of(context)!.entertainment,
      ),
    ];
  }
}
