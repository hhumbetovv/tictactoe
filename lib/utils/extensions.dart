import '../constants/app_strings.dart';

extension StringExtensions on String {
  String get playerOneNick {
    if (trim().isEmpty) return AppStrings.playerOne;
    return trim();
  }

  String get playerTwoNick {
    if (trim().isEmpty) return AppStrings.playerTwo;
    return trim();
  }
}
