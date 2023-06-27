import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

class AppText extends StatelessWidget {
  const AppText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          color: AppColors.text,
          fontSize: 18.spMin,
          height: 1.28,
        ),
      ),
    );
  }
}
