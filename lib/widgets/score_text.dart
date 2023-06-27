import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

class ScoreText extends StatelessWidget {
  const ScoreText({
    Key? key,
    required this.text,
    this.color,
  }) : super(key: key);

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20.spMin,
        color: AppColors.text,
        height: 1.25,
        shadows: color != null ? [Shadow(blurRadius: 10.spMin, color: color!)] : null,
      ),
    );
  }
}
