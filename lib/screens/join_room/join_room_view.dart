import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';
import '../../widgets/neon_button.dart';
import '../../widgets/neon_input.dart';
import '../../widgets/screen.dart';
import '../../widgets/title_text.dart';
import 'join_room_modal.dart';

class JoinRoomView extends StatefulWidget {
  static String get route => '/join_room';
  const JoinRoomView({
    Key? key,
  }) : super(key: key);

  @override
  State<JoinRoomView> createState() => _JoinRoomViewState();
}

class _JoinRoomViewState extends JoinRoomModal {
  @override
  Widget build(BuildContext context) {
    return Screen(
      isLoading: isLoading,
      children: [
        TitleText.withColor(
          text: AppStrings.joinRoom,
          color: AppColors.opponentNeon,
        ),
        NeonInput.withColor(
          controller: nickController,
          hintText: AppStrings.nickPlaceholder,
          color: AppColors.opponentNeon,
        ),
        NeonInput.withColor(
          controller: roomIdController,
          hintText: AppStrings.roomIdPlaceholder,
          color: AppColors.opponentNeon,
        ),
        NeonButton.withColor(
          text: AppStrings.join,
          isLoading: isLoading,
          onTap: joinRoom,
          color: AppColors.opponentNeon,
        ),
      ],
    );
  }
}
