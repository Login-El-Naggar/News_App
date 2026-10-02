import 'package:flutter/material.dart';
import 'package:news_app/api/model/homecategory_model/home_category.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/utils/AppStyles.dart';
import 'package:provider/provider.dart';

import '../providers/themeprovider.dart';
import '../utils/SizeUtils.dart';
import 'category_card.dart';

class HomeCategory extends StatelessWidget {
  Function onCategoryCardClick;

  HomeCategory({super.key, required this.onCategoryCardClick});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);

    var categoryList = HomeCategoryModel.homeCategoryList(
      ThemeProvider: themeProvider,
      context: context,
    );

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(context.height * 0.02),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                ' ${AppLocalizations.of(context)!.goodMorning} \n ${AppLocalizations.of(context)!.goodMorningHereIsSomeNewsForYou} ',
                style: themeProvider.isDark()
                    ? AppStyles.bold24white
                    : AppStyles.bold24black,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      onCategoryCardClick(categoryList[index]);
                    },
                    child: CategoryCard(
                      category: categoryList[index],
                      index: index,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: context.height * 0.02);
                },
                itemCount: categoryList.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
