import '../constants/app_strings.dart';
import '../models/player.dart';
import '../utils/extensions.dart';

class GameController {
  List<String> _board = ['', '', '', '', '', '', '', '', ''];
  late List<PlayerModel> _players;
  late bool _isOffline;
  int _turnIndex = 0;
  final int _maxRound = 3;

  GameController({
    required List<PlayerModel> players,
    bool isOffline = true,
  }) {
    _isOffline = isOffline;
    _players = players;
  }

  Map<String, dynamic> toJson() {
    return {
      'turnIndex': _turnIndex,
      'board': _board,
      'players': _players.map((player) => player.toJson()).toList(),
      'roomIsFull': roomIsFull,
    };
  }

  void setFromJson(Map<String, dynamic> json) {
    _turnIndex = json['turnIndex'];
    _board = (json['board'] as List).map((e) => e.toString()).toList();
    if (json['players'] != null && (json['players'] as List).isNotEmpty) {
      _players = (json['players'] as List).map((playerJson) {
        return PlayerModel.fromJson((playerJson as Map<Object?, Object?>).cast<String, dynamic>());
      }).toList();
    }
  }

  int addPlayer(String? nick) {
    if (roomIsFull) return -1;
    if (_players.isEmpty) {
      _players.add(PlayerModel(nick: (nick ?? '').playerOneNick, value: AppStrings.playerOneValue));
      return 0;
    }
    _players.add(PlayerModel(nick: (nick ?? '').playerTwoNick, value: AppStrings.playerTwoValue));
    return 1;
  }

  List<String> get board => _board;
  bool get isOffline => _isOffline;
  bool get isFullFilled => _board.every((element) => element.isNotEmpty);
  bool get isFullEmpty => _board.every((element) => element.isEmpty);
  PlayerModel get turningPlayer => _players[_turnIndex];
  PlayerModel get playerOne => _players[0];
  PlayerModel get playerTwo => _players[1];
  bool get roomIsFull => _players.length == 2;
  int get maxRound => _maxRound;
  int get turnIndex => _turnIndex;

  void setBoard(int index) {
    _board[index] = turningPlayer.value;
    _turnIndex = _turnIndex == 1 ? 0 : 1;
  }

  PlayerModel getWinner() {
    return _players.singleWhere((element) => element.value == checkWinner());
  }

  String checkWinner() {
    if (_checkLine(0, 1, 2)) return _board[0];
    if (_checkLine(3, 4, 5)) return _board[3];
    if (_checkLine(6, 7, 8)) return _board[6];
    if (_checkLine(0, 3, 6)) return _board[0];
    if (_checkLine(1, 4, 7)) return _board[1];
    if (_checkLine(2, 5, 8)) return _board[2];
    if (_checkLine(0, 4, 8)) return _board[0];
    if (_checkLine(2, 4, 6)) return _board[2];
    return '';
  }

  bool _checkLine(i, k, j) {
    return _board[i] == _board[k] && _board[k] == _board[j] && _board[i] != '';
  }

  void resetBoard() {
    _board = ['', '', '', '', '', '', '', '', ''];
  }
}
