import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

class NeonButton extends StatelessWidget {
  NeonButton({
    Key? key,
    required this.text,
    this.onTap,
    this.isLoading = false,
  })  : _color = AppColors.primaryNeon,
        super(key: key);

  const NeonButton.withColor({
    Key? key,
    required this.text,
    required Color color,
    this.onTap,
    this.isLoading = false,
  })  : _color = color,
        super(key: key);

  final String text;
  final Function()? onTap;
  final Color _color;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 540.spMin),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10.spMin),
          splashFactory: InkRipple.splashFactory,
          splashColor: _color.withOpacity(0.1),
          highlightColor: _color.withOpacity(0.1),
          child: Ink(
            height: 50.spMin,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(10.spMin),
              boxShadow: [
                BoxShadow(blurRadius: 5.spMin, color: _color),
              ],
            ),
            child: Center(
              child: isLoading
                  ? CircularProgressIndicator(
                      color: _color,
                    )
                  : Text(
                      text,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.spMin,
                        color: AppColors.text,
                        height: 1.28,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
