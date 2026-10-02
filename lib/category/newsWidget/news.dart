import 'package:flutter/cupertino.dart';
import 'package:news_app/category/newsWidget/newsWidget.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/utils/AppStyles.dart';
import 'package:provider/provider.dart';

import '../../api/api_manager.dart';
import '../../api/model/Sources.dart';
import '../../providers/languageProvider.dart';
import '../../providers/themeprovider.dart';
import '../../utils/SizeUtils.dart';
import '../../widgets/MainErrprWidget.dart';
import '../../widgets/MainLoadingWidget.dart';

class News extends StatelessWidget {
  Sources source;

  News({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);
    return FutureBuilder(
      future: ApiManager.getNews(source.id ?? '', languageProvider.AppLanguage),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          MainLoadingWidget();
        } else if (snapshot.hasError) {
          MainErrorWidget(
            onPressed: () => ApiManager.getNews(
              source.id ?? '',
              languageProvider.AppLanguage,
            ),
          );
        }
        if (snapshot.hasData) {
          var newsList = snapshot.data!.articles ?? [];
          return newsList.isEmpty
              ? Center(
            child: Text(" ${AppLocalizations.of(context)!.noDataFound}",
                style: themeProvider.isDark()
                    ? AppStyles.medium20white
                    : AppStyles.medium20black),
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return NewsWidget(
                      image: newsList[index].urlToImage ?? "",
                      discription: newsList[index].description ?? "",
                      auther: newsList[index].author ?? "",
                      data: newsList[index].publishedAt ?? "",
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: context.height * 0.02);
                  },
                  itemCount: newsList.length,
                );
        }
        return SizedBox();
      },
    );
  }
}
