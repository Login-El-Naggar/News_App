import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/utils/SizeUtils.dart';

import '../l10n/app_localizations.dart';
import '../utils/AppColors.dart';
import '../utils/AppStyles.dart';

class ReusableRawWidget extends StatelessWidget {
  final IconData icon;
  final String txt;

  const ReusableRawWidget({super.key, required this.icon, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.width * 0.04),
      child: Row(
        spacing: 10,
        children: [
          Icon(icon, color: AppColors.white, size: 30),
          Text(txt, style: AppStyles.bold24white),
        ],
      ),
    );
  }
}
