import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

class IdClipboard extends StatelessWidget {
  const IdClipboard({
    Key? key,
    required this.roomId,
  }) : super(key: key);

  final String roomId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 540.spMin),
        child: InkWell(
          onTap: () async {
            await Clipboard.setData(ClipboardData(text: roomId));
          },
          borderRadius: BorderRadius.circular(10.spMin),
          splashFactory: InkRipple.splashFactory,
          splashColor: AppColors.primaryNeon.withOpacity(0.1),
          highlightColor: AppColors.primaryNeon.withOpacity(0.1),
          child: Ink(
            height: 50.spMin,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(10.spMin),
              boxShadow: [
                BoxShadow(blurRadius: 5.spMin, color: AppColors.primaryNeon),
              ],
            ),
            child: Center(
              child: Text(
                roomId,
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
