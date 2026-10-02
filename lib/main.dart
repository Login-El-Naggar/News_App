import 'package:flutter/material.dart';
import 'package:news_app/providers/languageProvider.dart';
import 'package:news_app/providers/themeprovider.dart';
import 'package:news_app/utils/AppRouts.dart';
import 'package:news_app/utils/AppTheme.dart';
import 'package:provider/provider.dart';

import 'Home/homepage.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var languageProvider = Provider.of<LanguageProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      themeMode: themeProvider.appTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(languageProvider.AppLanguage),
      initialRoute: AppRouts.homePage,
      routes: {AppRouts.homePage: (context) => HomePage()},
    );
  }
}

//e65bd19a99444d6ba207e60f561e4270
