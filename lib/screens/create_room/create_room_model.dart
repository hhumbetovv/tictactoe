import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

import '../../controllers/game_controller.dart';
import '../../utils/extensions.dart';
import '../game_room/game_room_view.dart';
import 'create_room_view.dart';

abstract class CreateRoomModel extends State<CreateRoomView> {
  late final TextEditingController _nickController;
  bool _isLoading = false;

  TextEditingController get nickController => _nickController;
  bool get isLoading => _isLoading;

  @override
  void initState() {
    super.initState();
    _nickController = TextEditingController();
  }

  @override
  void dispose() {
    _nickController.dispose();
    super.dispose();
  }

  void createRoom() async {
    setState(() {
      _isLoading = true;
    });
    final GameController controller = GameController(players: [], isOffline: false);
    try {
      String roomId = const Uuid().v1().substring(0, 8);
      String nick = _nickController.text.playerOneNick;
      DatabaseReference roomReferance = FirebaseDatabase.instance.ref().child('rooms/$roomId');
      await roomReferance.set(controller.toJson());
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
    setState(() {
      _isLoading = false;
    });
  }
}
