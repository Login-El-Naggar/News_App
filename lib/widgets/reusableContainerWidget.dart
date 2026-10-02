import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/AppColors.dart';
import '../utils/AppStyles.dart';
import '../utils/SizeUtils.dart';

class ReusableContainerWidget extends StatelessWidget {
  final txt;
  final VoidCallback onPressed;
  final IconData icon;

  const ReusableContainerWidget({
    super.key,
    required this.txt,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.width * 0.04),
      child: Container(
        height: context.height * 0.07,
        decoration: BoxDecoration(
          color: AppColors.transparent,
          border: Border.all(color: AppColors.white, width: 2),
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(txt, style: AppStyles.bold24white),
              IconButton(
                onPressed: onPressed,
                icon: Icon(icon, color: AppColors.white, size: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
