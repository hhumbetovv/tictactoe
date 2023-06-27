import 'package:flutter/material.dart';

import '../../components/game_dialog.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';
import '../../controllers/game_controller.dart';
import '../../models/player.dart';
import '../../utils/extensions.dart';
import 'offline_view.dart';

abstract class OfflineModal extends State<OfflineView> {
  final GameController controller = GameController(players: [
    PlayerModel(nick: ''.playerOneNick, value: AppStrings.playerOneValue),
    PlayerModel(nick: ''.playerTwoNick, value: AppStrings.playerTwoValue),
  ]);

  void boardOnTap(index) {
    setState(() {
      controller.setBoard(index);
    });
    String winnerValue = controller.checkWinner();
    if (winnerValue.isNotEmpty || controller.isFullFilled) {
      String text = AppStrings.draw;
      if (winnerValue.isNotEmpty) {
        PlayerModel winner = controller.getWinner();
        text = '${winner.nick} Won!';
        winner.increasePoint();
      }
      showGameDialog(
        context: context,
        text: text,
        buttonText: AppStrings.playAgain,
        color: AppColors.getPlayerColor(winnerValue, controller.isOffline),
        onTap: () => setState(() {
          controller.resetBoard();
          Navigator.of(context).pop();
        }),
      );
    }
  }
}
