import 'package:flutter/material.dart';

import 'app_strings.dart';

@immutable
class AppColors {
  const AppColors._();

  static Color get background => const Color(0xFF100D18);
  static Color get primaryNeon => const Color(0xFF2196F3);
  static Color get secondaryNeon => const Color(0xFFF3B821);
  static Color get opponentNeon => const Color(0xFFF32121);
  static Color get inactive => const Color(0xFF8E8E93);
  static Color get text => const Color(0xFFFFFFFF);

  static Color getPlayerColor(String type, bool isOffline) {
    if (type.isEmpty) return text;
    if (type == AppStrings.playerOneValue) return primaryNeon;
    if (isOffline) return secondaryNeon;
    return opponentNeon;
  }
}
