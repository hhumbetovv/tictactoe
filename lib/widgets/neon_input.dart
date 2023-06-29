import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

class NeonInput extends StatelessWidget {
  NeonInput({
    Key? key,
    required this.controller,
    required this.hintText,
  })  : _color = AppColors.primaryNeon,
        super(key: key);

  const NeonInput.withColor({
    Key? key,
    required this.controller,
    required this.hintText,
    required Color color,
  })  : _color = color,
        super(key: key);

  final TextEditingController controller;
  final String hintText;
  final Color _color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 540.spMin),
        child: Container(
          height: 50.spMin,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(blurRadius: 5.spMin, color: _color),
            ],
            borderRadius: BorderRadius.circular(10.spMin),
          ),
          child: TextField(
            controller: controller,
            textInputAction: TextInputAction.next,
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18.spMin,
              color: AppColors.text,
              height: 1.28,
            ),
            cursorColor: _color,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 17.spMin),
              hintText: hintText,
              hintStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.spMin,
                color: AppColors.inactive,
                height: 1.28,
              ),
              filled: true,
              fillColor: AppColors.background,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.spMin),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
