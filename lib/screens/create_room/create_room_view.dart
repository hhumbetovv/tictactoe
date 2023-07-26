import 'package:flutter/material.dart';

import '../../constants/app_strings.dart';
import '../../widgets/neon_button.dart';
import '../../widgets/neon_input.dart';
import '../../widgets/screen.dart';
import '../../widgets/title_text.dart';
import 'create_room_model.dart';

class CreateRoomView extends StatefulWidget {
  static String get route => '/create_room';
  const CreateRoomView({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateRoomView> createState() => _CreateRoomViewState();
}

class _CreateRoomViewState extends CreateRoomModel {
  @override
  Widget build(BuildContext context) {
    return Screen(
      isLoading: isLoading,
      children: [
        TitleText(
          text: AppStrings.createRoom,
        ),
        NeonInput(
          controller: nickController,
          hintText: AppStrings.nickPlaceholder,
        ),
        NeonButton(
          text: AppStrings.create,
          isLoading: isLoading,
          onTap: createRoom,
        ),
      ],
    );
  }
}
