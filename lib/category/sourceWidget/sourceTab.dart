import 'package:flutter/cupertino.dart';
import 'package:news_app/utils/AppStyles.dart';
import 'package:provider/provider.dart';
import '../../api/model/Sources.dart';
import '../../providers/themeprovider.dart';

class SourceTab extends StatelessWidget {
  SourceTab({super.key, required this.source, required this.isSelected});

  Sources source;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Text(
      source.name!,
      style: themeProvider.isDark()
          ? isSelected
                ? AppStyles.bold24white
                : AppStyles.medium20white
          : isSelected
          ? AppStyles.bold24black
          : AppStyles.medium20black,
    );
  }
}
