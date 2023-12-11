import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/game_board.dart';
import '../../components/score_board.dart';
import '../../constants/app_colors.dart';
import '../../widgets/screen.dart';
import '../../widgets/turn_text.dart';
import 'with_ai_model.dart';

final class WithAIView extends StatefulWidget {
  static String get route => '/with_ai';
  const WithAIView({
    Key? key,
  }) : super(key: key);

  @override
  State<WithAIView> createState() => _WithAIViewState();
}

class _WithAIViewState extends WithAiModel {
  @override
  Widget build(BuildContext context) {
    return Screen(
      children: [
        ScoreBoard(
          playerOneNick: controller.playerOne.nick,
          playerTwoNick: controller.playerTwo.nick,
          playerOnePoint: controller.playerOne.point.toString(),
          playerTwoPoint: controller.playerTwo.point.toString(),
          playerOneColor: AppColors.primaryNeon,
          playerTwoColor: AppColors.neon,
        ),
        GameBoard(
          controller: controller,
          onTap: boardOnTap,
          withAi: true,
        ),
        SizedBox(height: 40.h),
        TurnText(
          yourTurn: controller.turnIndex == 0,
          nick: controller.turningPlayer.nick,
          color: controller.turnIndex == 0 ? AppColors.primaryNeon : AppColors.neon,
          isLoading: isLoading,
        ),
      ],
    );
  }
}
