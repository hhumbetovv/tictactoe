import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/game_board.dart';
import '../../components/score_board.dart';
import '../../constants/app_colors.dart';
import '../../widgets/screen.dart';
import '../../widgets/turn_text.dart';
import 'offline_model.dart';

class OfflineView extends StatefulWidget {
  static String get route => '/offline';
  const OfflineView({
    Key? key,
  }) : super(key: key);

  @override
  State<OfflineView> createState() => _OfflineViewState();
}

class _OfflineViewState extends OfflineModel {
  @override
  Widget build(BuildContext context) {
    return Screen(
      isCenter: false,
      children: [
        ScoreBoard(
          playerOnePoint: controller.playerOne.point.toString(),
          playerTwoPoint: controller.playerTwo.point.toString(),
          playerOneColor: AppColors.getPlayerColor(controller.playerOne.value, controller.isOffline),
          playerTwoColor: AppColors.getPlayerColor(controller.playerTwo.value, controller.isOffline),
        ),
        GameBoard(
          controller: controller,
          onTap: boardOnTap,
        ),
        SizedBox(height: 40.h),
        TurnText(
          nick: controller.turningPlayer.nick,
          color: AppColors.getPlayerColor(controller.turningPlayer.value, controller.isOffline),
        ),
      ],
    );
  }
}
