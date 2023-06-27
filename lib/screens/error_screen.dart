import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/app_strings.dart';
import '../widgets/app_text.dart';
import '../widgets/neon_button.dart';
import '../widgets/screen.dart';
import 'main/main_view.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    Key? key,
    this.error,
  }) : super(key: key);

  final String? error;

  @override
  Widget build(BuildContext context) {
    return Screen(
      children: [
        AppText(text: error ?? AppStrings.defaultError),
        NeonButton(
          text: AppStrings.backMenu,
          onTap: () {
            context.go(MainView.route);
          },
        ),
      ],
    );
  }
}
