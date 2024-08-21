import 'package:flutter/material.dart';
import 'package:sports_2048/utils/colors.dart';
import 'package:sports_2048/views/screens/game/board_screen.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: const SafeArea(
        child: Center(
          child: BoardScreen(),
        ),
      ),
    );
  }
}
