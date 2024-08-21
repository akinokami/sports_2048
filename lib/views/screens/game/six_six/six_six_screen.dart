import 'package:flutter/material.dart';
import 'package:sports_2048/utils/colors.dart';
import 'package:sports_2048/views/screens/game/six_six/six_board_screen.dart';

class SixSixScreen extends StatelessWidget {
  const SixSixScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: const SafeArea(
        child: Center(
          child: SixBoardScreen(),
        ),
      ),
    );
  }
}
