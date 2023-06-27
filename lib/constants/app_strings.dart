import 'package:flutter/foundation.dart';

@immutable
class AppStrings {
  const AppStrings._();
  //! Titles
  static String get appTitle => 'Tic Tac Toe';
  static String get createRoom => 'Create Room';
  static String get joinRoom => 'Join Room';
  static String get playOffline => 'Play Offline';
  //! Placeholders
  static String get nickPlaceholder => 'Enter Your Nickname';
  static String get roomIdPlaceholder => 'Enter Room Id';
  static String get create => 'Create';
  static String get join => 'Join';
  static String get waiting => 'Waiting for a player to Join ...';
  //! Dialogs
  static String get playAgain => 'Play Again';
  static String get backMenu => 'Back to the Menu';
  static String get draw => 'Draw';
  static String get youWon => 'You Won!';
  static String get youWonGame => 'You Won the Game!';
  //! Game
  static String get playerOne => 'Player One';
  static String get playerTwo => 'Player Two';
  static String get playerOneValue => 'X';
  static String get playerTwoValue => 'O';
  static String get yourTurn => 'Your Turn';
  static String get yourNick => 'You';
  //! Errors
  static String get defaultError => 'Something went wrong';
  static String get invalidRoom => 'Invalid Room Id';
  static String get roomIsFull => 'The Room is full';
}
