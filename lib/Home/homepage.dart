import 'package:flutter/material.dart';
import 'package:news_app/api/model/homecategory_model/home_category.dart';
import 'package:news_app/category/categoryDetails.dart';
import 'package:news_app/home_category/homeCategory.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../providers/languageProvider.dart';
import '../providers/themeprovider.dart';
import '../utils/AppColors.dart';
import '../utils/AppStyles.dart';
import '../utils/SizeUtils.dart';
import '../widgets/dropDownMenu.dart';
import '../widgets/reusabelRawWidget.dart';
import '../widgets/reusableContainerWidget.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var languageProvider = Provider.of<LanguageProvider>(context);
    // var categoryList=HomeCategoryModel.homeCategoryList(ThemeProvider: themeProvider, context: context);
    String selectedLanguage = languageProvider.AppLanguage == "ar"
        ? AppLocalizations.of(context)!.arabic
        : AppLocalizations.of(context)!.english;

    String selectedTheme = themeProvider.isDark()
        ? AppLocalizations.of(context)!.dark
        : AppLocalizations.of(context)!.light;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            selectedCategory == null
                ? AppLocalizations.of(context)!.general
                : selectedCategory!.title,
            style: themeProvider.isDark()
                ? AppStyles.bold24white
                : AppStyles.bold24black,
          ),
          actions: [
            IconButton(
              onPressed: () {
                // todo:search
              },
              icon: Icon(Icons.search),
            ),
          ],
        ),
        drawer: Drawer(
          backgroundColor: AppColors.black,
          width: context.width * 0.79,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: context.height * 0.25,
                color: AppColors.white,
                child: Center(
                  child: Text(
                    AppLocalizations.of(context)!.newsApp,
                    style: AppStyles.bold24black,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  selectedCategory = null;
                  Navigator.pop(context);
                  setState(() {});
                },
                child: ReusableRawWidget(
                  icon: Icons.home_outlined,
                  txt: AppLocalizations.of(context)!.goToHome,
                ),
              ),
              Divider(
                thickness: 2,
                color: AppColors.white,
                indent: context.width * 0.04,
                endIndent: context.width * 0.04,
              ),
              ReusableRawWidget(
                icon: Icons.format_paint_outlined,
                txt: AppLocalizations.of(context)!.theme,
              ),
              ReusableContainerWidget(
                txt: themeProvider.isDark()
                    ? AppLocalizations.of(context)!.dark
                    : AppLocalizations.of(context)!.light,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return DropDownMenuWidget(
                        selectedValue: selectedTheme,
                        onPresssed: () {
                          if (selectedTheme ==
                              AppLocalizations.of(context)!.dark) {
                            themeProvider.changeTheme(ThemeMode.light);
                          } else {
                            themeProvider.changeTheme(ThemeMode.dark);
                          }
                          Navigator.pop(context);
                        },
                        value1: AppLocalizations.of(context)!.dark,
                        value2: AppLocalizations.of(context)!.light,
                        choice1: AppLocalizations.of(context)!.dark,
                        choice2: AppLocalizations.of(context)!.light,
                      );
                    },
                  );
                },
                icon: Icons.arrow_drop_down,
              ),
              Divider(
                thickness: 2,
                color: AppColors.white,
                indent: context.width * 0.04,
                endIndent: context.width * 0.04,
              ),
              ReusableRawWidget(
                icon: Icons.language,
                txt: AppLocalizations.of(context)!.language,
              ),
              ReusableContainerWidget(
                txt: languageProvider.AppLanguage == "ar"
                    ? AppLocalizations.of(context)!.arabic
                    : AppLocalizations.of(context)!.english,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return DropDownMenuWidget(
                        selectedValue: selectedLanguage,
                        onPresssed: () {
                          if (selectedLanguage ==
                              AppLocalizations.of(context)!.arabic) {
                            languageProvider.changeLanguage("en");
                          } else {
                            languageProvider.changeLanguage("ar");
                          }
                          Navigator.pop(context);
                        },
                        value1: AppLocalizations.of(context)!.english,
                        value2: AppLocalizations.of(context)!.arabic,
                        choice1: AppLocalizations.of(context)!.english,
                        choice2: AppLocalizations.of(context)!.arabic,
                      );
                    },
                  );
                },
                icon: Icons.arrow_drop_down,
              ),
            ],
          ),
        ),
        body: selectedCategory == null
            ? HomeCategory(onCategoryCardClick: onCategoryCardClick)
            : CategoryDetails(category: selectedCategory!),
      ),
    );
  }

  HomeCategoryModel? selectedCategory;

  void onCategoryCardClick(HomeCategoryModel newCategory) {
    selectedCategory = newCategory;
    setState(() {});
  }
}
