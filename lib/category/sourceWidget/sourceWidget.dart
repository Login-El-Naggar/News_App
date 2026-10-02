import 'package:flutter/material.dart';
import 'package:news_app/category/newsWidget/news.dart';
import 'package:news_app/category/sourceWidget/sourceTab.dart';
import 'package:news_app/utils/SizeUtils.dart';
import 'package:provider/provider.dart';

import '../../api/model/Sources.dart';
import '../../providers/themeprovider.dart';
import '../../utils/AppColors.dart';

class SourceWidget extends StatefulWidget {
  List<Sources> sourcesList;

  SourceWidget({super.key, required this.sourcesList});

  @override
  State<SourceWidget> createState() => _SourceWidgetState();
}

class _SourceWidgetState extends State<SourceWidget> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Column(
        children: [
          TabBar(
            onTap: (index) {
              selectedindex = index;
              setState(() {});
            },
            isScrollable: true,
            dividerColor: AppColors.transparent,
            tabAlignment: TabAlignment.start,
            indicatorColor: themeProvider.isDark()
                ? AppColors.white
                : AppColors.black,
            tabs: widget.sourcesList.map((source) {
              return SourceTab(
                source: source,
                isSelected: selectedindex == widget.sourcesList.indexOf(source),
              );
            }).toList(),
          ),
          SizedBox(height: context.height * 0.03),
          Expanded(child: News(source: widget.sourcesList[selectedindex])),
        ],
      ),
    );
  }
}
