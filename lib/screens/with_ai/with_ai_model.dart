import 'dart:math';

import 'package:flutter/material.dart';

import '../../components/game_dialog.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';
import '../../controllers/game_controller.dart';
import '../../models/player.dart';
import 'with_ai_view.dart';

abstract class WithAiModel extends State<WithAIView> {
  final GameController controller = GameController(players: [
    PlayerModel(nick: 'You', value: AppStrings.playerOneValue),
    PlayerModel(nick: 'AI', value: AppStrings.playerTwoValue),
  ]);
  bool isLoading = false;

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
        color: AppColors.getPlayerColor(winnerValue, controller.isOffline, true),
        onTap: () => setState(() {
          controller.resetBoard();
          Navigator.of(context).pop();
          if (controller.turnIndex == 1) aiTurn();
        }),
      );
    }
    if (!controller.isFullFilled && controller.turnIndex == 1) aiTurn();
  }

  void aiTurn() async {
    setState(() => isLoading = true);
    await Future.delayed(const Duration(milliseconds: 700));
    int aiMove = findBestMove(controller.board, 'O');
    setState(() => isLoading = false);
    boardOnTap(aiMove);
  }

  int findBestMove(List<String> board, String player) {
    int bestScore = -1000;
    int bestMove = -1;
    for (int i = 0; i < board.length; i++) {
      if (board[i] == '') {
        board[i] = player;
        int moveScore = minimax(board, 0, false);
        board[i] = '';
        if (moveScore > bestScore) {
          bestScore = moveScore;
          bestMove = i;
        }
      }
    }
    return bestMove;
  }

  int minimax(List<String> board, int depth, bool isMaximizing) {
    String winner = checkWinner(board);
    if (winner == 'O') {
      return 10 - depth;
    } else if (winner == 'X') {
      return depth - 10;
    } else if (board.contains('') == false) {
      return 0;
    }
    if (isMaximizing) {
      int bestScore = -1000;
      for (int i = 0; i < board.length; i++) {
        if (board[i] == '') {
          board[i] = 'O';
          bestScore = max(bestScore, minimax(board, depth + 1, !isMaximizing));
          board[i] = '';
        }
      }
      return bestScore;
    } else {
      int bestScore = 1000;
      for (int i = 0; i < board.length; i++) {
        if (board[i] == '') {
          board[i] = 'X';
          bestScore = min(bestScore, minimax(board, depth + 1, !isMaximizing));
          board[i] = '';
        }
      }
      return bestScore;
    }
  }

  String checkWinner(List<String> board) {
    for (int i = 0; i <= 6; i += 3) {
      if (board[i] != '' && board[i] == board[i + 1] && board[i + 1] == board[i + 2]) {
        return board[i];
      }
    }
    for (int i = 0; i <= 2; i++) {
      if (board[i] != '' && board[i] == board[i + 3] && board[i + 3] == board[i + 6]) {
        return board[i];
      }
    }
    if (board[4] != '' &&
        (((board[0] == board[4]) && (board[4] == board[8])) || ((board[2] == board[4]) && (board[4] == board[6])))) {
      return board[4];
    }
    if (!board.contains('')) {
      return 'draw';
    }
    return '';
  }
}
