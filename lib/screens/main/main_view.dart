import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';
import '../../widgets/neon_button.dart';
import '../../widgets/screen.dart';
import '../../widgets/title_text.dart';
import '../create_room/create_room_view.dart';
import '../join_room/join_room_view.dart';
import '../offline/offline_view.dart';

class MainView extends StatelessWidget {
  static String get route => '/';
  const MainView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Screen(
      children: [
        TitleText(
          text: AppStrings.appTitle,
        ),
        NeonButton(
          text: AppStrings.createRoom,
          onTap: () => kIsWeb ? context.go(CreateRoomView.route) : context.push(CreateRoomView.route),
        ),
        NeonButton.withColor(
          text: AppStrings.joinRoom,
          color: AppColors.opponentNeon,
          onTap: () => kIsWeb ? context.go(JoinRoomView.route) : context.push(JoinRoomView.route),
        ),
        NeonButton.withColor(
          text: AppStrings.playOffline,
          color: AppColors.secondaryNeon,
          onTap: () => kIsWeb ? context.go(OfflineView.route) : context.push(OfflineView.route),
        ),
      ],
    );
  }
}
