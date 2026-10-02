import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/themeprovider.dart';
import '../utils/AppColors.dart';

class MainLoadingWidget extends StatelessWidget {
  const MainLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Center(
      child: CircularProgressIndicator(
        color: themeProvider.isDark() ? AppColors.white : AppColors.black,
      ),
    );
  }
}
