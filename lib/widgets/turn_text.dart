import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../constants/app_strings.dart';

class TurnText extends StatelessWidget {
  const TurnText({
    Key? key,
    required this.nick,
    required this.color,
    this.yourTurn = false,
  }) : super(key: key);

  final String nick;
  final Color color;
  final bool yourTurn;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          yourTurn ? AppStrings.yourTurn : '$nick\'s Turn',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 25.spMin,
            color: AppColors.text,
            height: 1.24,
            shadows: [
              Shadow(blurRadius: 10.spMin, color: color),
            ],
          ),
        ),
      ),
    );
  }
}
