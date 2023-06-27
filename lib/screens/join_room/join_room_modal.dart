import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utils/extensions.dart';
import '../game_room/game_room_view.dart';
import 'join_room_view.dart';

abstract class JoinRoomModal extends State<JoinRoomView> {
  late final TextEditingController _nickController;
  late final TextEditingController _roomIdController;
  final bool _isLoading = false;

  TextEditingController get nickController => _nickController;
  TextEditingController get roomIdController => _roomIdController;
  bool get isLoading => _isLoading;

  @override
  void initState() {
    super.initState();
    _nickController = TextEditingController();
    _roomIdController = TextEditingController();
  }

  @override
  void dispose() {
    _nickController.dispose();
    super.dispose();
  }

  void joinRoom() async {
    try {
      String roomId = _roomIdController.text.trim();
      String nick = _nickController.text.playerTwoNick;
      if (mounted) {
        if (kIsWeb) {
          context.go('${GameRoomView.route}?roomId=$roomId&nick=$nick');
        } else {
          context.push('${GameRoomView.route}?roomId=$roomId&nick=$nick');
        }
      }
    } catch (err) {
      debugPrint(err.toString());
    }
  }
}
