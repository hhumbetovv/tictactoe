import 'package:flutter/material.dart';

import '../constants/app_strings.dart';
import '../widgets/app_text.dart';
import '../widgets/id_clipboard.dart';
import '../widgets/screen.dart';

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({
    Key? key,
    required this.roomId,
  }) : super(key: key);

  final String roomId;

  @override
  Widget build(BuildContext context) {
    return Screen(
      children: [
        AppText(text: AppStrings.waiting),
        IdClipboard(roomId: roomId),
      ],
    );
  }
}
