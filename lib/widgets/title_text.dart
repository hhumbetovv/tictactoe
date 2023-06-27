import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

class TitleText extends StatelessWidget {
  TitleText({
    Key? key,
    required this.text,
  }) : super(key: key) {
    _color = AppColors.primaryNeon;
  }

  TitleText.withColor({
    Key? key,
    required this.text,
    required Color color,
  }) : super(key: key) {
    _color = color;
  }

  final String text;
  late final Color _color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: AppColors.text,
          fontSize: 70.spMin,
          height: 1.26,
          shadows: [
            Shadow(
              blurRadius: 15.spMin,
              color: _color,
            ),
          ],
        ),
      ),
    );
  }
}
