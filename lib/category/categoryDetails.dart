import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/api/model/SourceResponse.dart';
import 'package:news_app/api/model/homecategory_model/home_category.dart';
import 'package:news_app/category/sourceWidget/sourceWidget.dart';
import 'package:news_app/widgets/MainErrprWidget.dart';
import 'package:news_app/widgets/MainLoadingWidget.dart';
import 'package:provider/provider.dart';

import '../providers/languageProvider.dart';

class CategoryDetails extends StatefulWidget {
  HomeCategoryModel category;

  CategoryDetails({super.key, required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      body: FutureBuilder<SourceResponse>(
        future: ApiManager.getSources(
          languageProvider.AppLanguage,
          widget.category.id,
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            MainLoadingWidget();
          } else if (snapshot.hasError) {
            MainErrorWidget(
              onPressed: () => ApiManager.getSources(
                languageProvider.AppLanguage,
                widget.category.id,
              ),
            );
          }
          if (snapshot.hasData) {
            var sourceList = snapshot.data?.sources;
            return SourceWidget(sourcesList: sourceList ?? []);
          }
          return SizedBox();
        },
      ),
    );
  }
}
