import 'package:flutter/cupertino.dart';
import 'package:news_app/utils/AppColors.dart';
import 'package:news_app/utils/AppStyles.dart';
import 'package:news_app/utils/SizeUtils.dart';
import 'package:provider/provider.dart';

import '../../providers/themeprovider.dart';

class NewsWidget extends StatelessWidget {
  String image;
  String discription;
  String auther;
  String data;

  NewsWidget({
    super.key,
    required this.image,
    required this.discription,
    required this.auther,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      padding: EdgeInsetsGeometry.all(context.width * 0.02),
      margin: EdgeInsetsGeometry.symmetric(horizontal: context.width * 0.02),
      height: context.height / 1.8,
      width: context.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(16),
        border: BoxBorder.all(
          width: 2,
          color: themeProvider.isDark() ? AppColors.white : AppColors.black,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(16),
            child: Image.network(
              image,
              height: context.height / 2.5,
              width: context.width,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            discription,
            style: TextStyle(
              color: themeProvider.isDark() ? AppColors.white : AppColors.black,
            ),
            maxLines: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  " by $auther",
                  style: AppStyles.bold14grey,
                  softWrap: true,
                ),
              ),
              //Text( data,style: AppStyles.bold14grey,maxLines: 1,)
            ],
          ),
        ],
      ),
    );
  }
}
