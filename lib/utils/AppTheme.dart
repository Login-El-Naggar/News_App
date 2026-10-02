import 'package:flutter/material.dart';

import 'AppColors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.black),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.black,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.white),
    ),
  );
}
