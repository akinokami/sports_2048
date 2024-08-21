import 'package:flutter/material.dart';
import 'package:sports_2048/utils/colors.dart';
import 'package:sports_2048/views/screens/game/five_five/five_board_screen.dart';

class FiveFiveScreen extends StatelessWidget {
  const FiveFiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: const SafeArea(
        child: Center(
          child: FiveBoardScreen(),
        ),
      ),
    );
  }
}
