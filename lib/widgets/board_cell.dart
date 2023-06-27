import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

class BoardCell extends StatelessWidget {
  BoardCell({
    Key? key,
    required this.onTap,
    required this.value,
    required this.isOffline,
  }) : super(key: key) {
    color = AppColors.getPlayerColor(value, isOffline);
  }

  final Function() onTap;
  final String value;
  final bool isOffline;
  late final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: value.isEmpty ? onTap : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceOut,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(5.spMin),
          boxShadow: [
            BoxShadow(color: color, blurRadius: 5.spMin),
          ],
        ),
        child: AnimatedScale(
          duration: const Duration(milliseconds: 300),
          curve: Curves.bounceOut,
          scale: value.isEmpty ? 0 : 1,
          child: Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.text,
              fontSize: 80.spMin,
              height: 1.25,
              shadows: [
                Shadow(color: color, blurRadius: 15.spMin),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
