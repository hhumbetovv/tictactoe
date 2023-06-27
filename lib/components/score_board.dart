import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_strings.dart';
import '../widgets/score_text.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({
    super.key,
    this.playerOneNick,
    this.playerTwoNick,
    required this.playerOnePoint,
    required this.playerTwoPoint,
    required this.playerOneColor,
    required this.playerTwoColor,
  });

  final String? playerOneNick;
  final String? playerTwoNick;
  final String playerOnePoint;
  final String playerTwoPoint;
  final Color playerOneColor;
  final Color playerTwoColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              ScoreText(
                text: playerOneNick ?? AppStrings.playerOne,
                color: playerOneColor,
              ),
              SizedBox(height: 10.h),
              ScoreText(
                text: playerOnePoint,
                color: playerOneColor,
              ),
            ],
          ),
          Column(
            children: [
              ScoreText(
                text: playerTwoNick ?? AppStrings.playerTwo,
                color: playerTwoColor,
              ),
              SizedBox(height: 10.h),
              ScoreText(
                text: playerTwoPoint,
                color: playerTwoColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
