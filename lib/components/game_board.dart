import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controllers/game_controller.dart';
import '../widgets/board_cell.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({
    Key? key,
    required this.controller,
    required this.onTap,
    this.withAi = false,
  }) : super(key: key);

  final GameController controller;
  final Function(int index) onTap;
  final bool withAi;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.65),
      child: AspectRatio(
        aspectRatio: 1,
        child: GridView.builder(
          itemCount: 9,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 15.spMin,
            mainAxisSpacing: 15.spMin,
          ),
          physics: const NeverScrollableScrollPhysics(),
          clipBehavior: Clip.none,
          itemBuilder: (context, index) {
            return BoardCell(
              onTap: () => onTap(index),
              value: controller.board[index],
              isOffline: controller.isOffline,
              withAi: withAi,
            );
          },
        ),
      ),
    );
  }
}
