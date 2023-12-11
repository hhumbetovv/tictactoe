import 'dart:ui';

import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

final class Loader extends StatelessWidget {
  const Loader({Key? key, this.color}) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: CircularProgressIndicator(
            color: color ?? AppColors.primaryNeon,
          ),
        ),
        Positioned.fill(
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Center(
                child: Container(),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16),
          child: CircularProgressIndicator(color: Colors.white),
        ),
      ],
    );
  }
}
