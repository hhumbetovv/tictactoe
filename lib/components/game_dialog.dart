import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

void showGameDialog({
  required BuildContext context,
  required String text,
  required String buttonText,
  required Color color,
  required Function() onTap,
}) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.spMin, sigmaY: 5.spMin),
        child: Dialog(
          backgroundColor: AppColors.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.spMin),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 540.spMin),
            child: Padding(
              padding: EdgeInsets.all(30.spMin),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25.spMin,
                      height: 1.24,
                      color: AppColors.text,
                      shadows: [
                        Shadow(blurRadius: 5.spMin, color: color),
                      ],
                    ),
                  ),
                  SizedBox(height: 35.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: onTap,
                      style: TextButton.styleFrom(
                        foregroundColor: color,
                      ),
                      child: Text(
                        buttonText,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.spMin,
                          height: 1.17,
                          color: AppColors.text,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
