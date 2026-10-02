import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/model/homecategory_model/home_category.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/utils/AppColors.dart';
import 'package:provider/provider.dart';

import '../providers/themeprovider.dart';
import '../utils/AppStyles.dart';
import '../utils/SizeUtils.dart';

class CategoryCard extends StatelessWidget {
  HomeCategoryModel category;
  int index;

  CategoryCard({super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var isEven = (index % 2 == 0);
    return Padding(
      padding: EdgeInsets.all(context.height * 0.01),
      child: Stack(
        alignment: isEven ? Alignment.centerRight : Alignment.centerLeft,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(24),
            child: Image.asset(category.image),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.width * 0.04,
                  vertical: context.height * 0.02,
                ),
                child: Text(
                  category.title,
                  style: themeProvider.isDark()
                      ? AppStyles.bold24black
                      : AppStyles.bold24white,
                ),
              ),
              Container(
                height: context.height * 0.06,
                width: context.width * 0.4,
                padding: EdgeInsetsGeometry.all(context.width * 0.02),
                margin: EdgeInsetsGeometry.all(context.width * 0.02),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusGeometry.circular(84),
                  color: AppColors.gray,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.viewAll,
                      style: themeProvider.isDark()
                          ? AppStyles.medium20black
                          : AppStyles.medium20white,
                    ),
                    CircleAvatar(
                      backgroundColor: themeProvider.isDark()
                          ? AppColors.black
                          : AppColors.white,
                      child: IconButton(
                        onPressed: () {
                          // todo:navigater to details
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: themeProvider.isDark()
                              ? AppColors.white
                              : AppColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
