import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/game_board.dart';
import '../../components/score_board.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';
import '../../widgets/screen.dart';
import '../../widgets/turn_text.dart';
import '../error_screen.dart';
import '../waiting_screen.dart';
import 'game_room_modal.dart';

class GameRoomView extends StatefulWidget {
  static String get route => '/game_room';
  const GameRoomView({
    Key? key,
    required this.roomId,
    required this.nick,
  }) : super(key: key);

  final String? roomId;
  final String? nick;

  @override
  State<GameRoomView> createState() => _GameRoomViewState();
}

class _GameRoomViewState extends GameRoomModal {
  @override
  Widget build(BuildContext context) {
    if (widget.roomId == null || widget.roomId!.isEmpty) {
      return ErrorScreen(
        error: AppStrings.invalidRoom,
      );
    }
    if (isLoading) {
      return const Screen(
        children: [
          CircularProgressIndicator(),
        ],
      );
    }
    if (playerIndex == -1) {
      return ErrorScreen(
        error: AppStrings.roomIsFull,
      );
    }
    return StreamBuilder(
      stream: FirebaseDatabase.instance.ref().child('rooms/${widget.roomId}').onValue,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          DataSnapshot dataSnapshot = snapshot.data!.snapshot;
          Map<String, dynamic>? data = (dataSnapshot.value as Map<Object?, Object?>?)?.cast<String, dynamic>();
          if (data == null) {
            return ErrorScreen(
              error: AppStrings.invalidRoom,
            );
          }
          updateController(data, context);
          if (!controller.roomIsFull) {
            return WaitingScreen(
              roomId: widget.roomId!,
            );
          }
          return Screen(
            isCenter: false,
            children: [
              ScoreBoard(
                playerOneNick: playerIndex == 0 ? AppStrings.yourNick : controller.playerOne.nick,
                playerTwoNick: playerIndex == 1 ? AppStrings.yourNick : controller.playerTwo.nick,
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
                yourTurn: playerIndex == controller.turnIndex,
                color: AppColors.getPlayerColor(controller.turningPlayer.value, controller.isOffline),
              ),
            ],
          );
        }
        return const Screen(
          children: [
            CircularProgressIndicator(),
          ],
        );
      },
    );
  }
}
