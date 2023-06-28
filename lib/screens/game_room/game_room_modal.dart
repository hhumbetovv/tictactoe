import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';

import '../../components/game_dialog.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';
import '../../controllers/game_controller.dart';
import '../../models/player.dart';
import '../main/main_view.dart';
import 'game_room_view.dart';

abstract class GameRoomModal extends State<GameRoomView> with WidgetsBindingObserver {
  final GameController _controller = GameController(players: [], isOffline: false);
  late final DatabaseReference _roomReferance;
  int _playerIndex = -1;
  bool _isLoading = false;
  bool _dialogShown = false;

  GameController get controller => _controller;
  int get playerIndex => _playerIndex;
  bool get isLoading => _isLoading;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    initialize();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.detached) {
      _roomReferance.remove();
    }
  }

  @override
  void dispose() {
    _roomReferance.remove();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void initialize() async {
    setState(() {
      _isLoading = true;
    });
    try {
      _roomReferance = FirebaseDatabase.instance.ref().child('rooms/${widget.roomId}');
      DataSnapshot roomSnapshot = await _roomReferance.get();
      if (roomSnapshot.exists) {
        if (mounted) updateController((roomSnapshot.value as Map<Object?, Object?>).cast<String, dynamic>(), context);
        _playerIndex = _controller.addPlayer(widget.nick);
      }
      if (_playerIndex != -1) await _roomReferance.set(_controller.toJson());
    } catch (e) {
      debugPrint(e.toString());
    }
    setState(() {
      _isLoading = false;
    });
  }

  void boardOnTap(index) {
    if (_controller.turnIndex == _playerIndex) {
      setState(() {
        _controller.setBoard(index);
        _roomReferance.update(_controller.toJson());
      });
    }
  }

  void updateController(Map<String, dynamic> json, BuildContext context) async {
    _controller.setFromJson(json);
    String winnerValue = _controller.checkWinner();
    if (winnerValue.isNotEmpty || _controller.isFullFilled) {
      String text = AppStrings.draw;
      bool gameOver = false;
      if (winnerValue.isNotEmpty) {
        PlayerModel winner = _controller.getWinner();
        winner.increasePoint();
        gameOver = winner.point == _controller.maxRound;
        bool yourTurn = _playerIndex != _controller.turnIndex;
        if (gameOver) {
          text = yourTurn ? AppStrings.youWonGame : '${winner.nick} Won the Game!';
        } else {
          text = yourTurn ? AppStrings.youWon : '${winner.nick} Won!';
        }
      }
      if (!_dialogShown) {
        _dialogShown = true;
        Future.delayed(const Duration(seconds: 1), () {
          _controller.resetBoard();
          _roomReferance.update(_controller.toJson());
        });
        SchedulerBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            showGameDialog(
              context: context,
              text: text,
              buttonText: gameOver ? AppStrings.backMenu : AppStrings.playAgain,
              color: AppColors.getPlayerColor(winnerValue, _controller.isOffline),
              onTap: () {
                if (gameOver) {
                  context.go(MainView.route);
                  _dialogShown = false;
                } else {
                  Navigator.of(context).pop();
                  _dialogShown = false;
                }
              },
            );
          }
        });
      }
    }
  }
}
