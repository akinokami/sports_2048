import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sports_2048/models/board_five.dart';
import 'package:sports_2048/utils/colors.dart';
import 'package:sports_2048/utils/constants.dart';
import 'package:sports_2048/utils/query_data.dart';
import 'package:sports_2048/views/screens/setting/setting_screen.dart';
import 'package:sports_2048/views/widgets/board.dart';
import 'package:sports_2048/views/widgets/custom_text.dart';
import 'package:sports_2048/views/widgets/tile_five.dart';
import 'package:sports_2048/views/widgets/toggle.dart';

class FiveBoardScreen extends StatefulWidget {
  const FiveBoardScreen({Key? key}) : super(key: key);

  @override
  State<FiveBoardScreen> createState() => _FiveBoardScreenState();
}

class _FiveBoardScreenState extends State<FiveBoardScreen> {
  late BoardFive _board;
  late int _row;
  late int _column;

  @override
  void initState() {
    super.initState();
    _row = 5;
    _column = 5;
    _board = BoardFive(_row, _column);

    newGame();
  }

  void newGame() {
    setState(() {
      _board.initBoard();
    });
  }

  Iterable<Widget> getRenderedTiles() {
    List<List<Widget>> tileWidgets = List.generate(5, (row) {
      return List.generate(5, (column) {
        return Positioned(
          top: row * tileSize5,
          left: column * tileSize5,
          width: tileSize5,
          height: tileSize5,
          child:
              Center(child: TileFiveWidget(tile: _board.getTile(row, column))),
        );
      });
    });
    return tileWidgets.expand((e) => e);
  }

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);

    List<Widget> children = [];
    children.addAll(getRenderedTiles());

    if (_board.gameOver() || _board.gameVictory()) {
      children.add(
        Opacity(
          opacity: 0.75,
          child: Container(
            decoration: BoxDecoration(
              color: boardColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      );
      children.add(
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _board.gameOver()
                    ? 'Game Over'
                    : _board.gameVictory()
                        ? 'Game Victory'
                        : '',
              ),
              Text(
                _board.gameOver()
                    ? 'Press New Game Button To Start again!'
                    : _board.gameVictory()
                        ? 'Congratulation You Win The Game!'
                        : '',
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            CustomText(
              text: '2048',
              size: 24.sp,
              fontWeight: FontWeight.bold,
              textColor: Colors.grey.shade700,
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Toggle(
                  title: 'score'.tr,
                  subTitle: _board.score.toString(),
                ),
                Toggle(
                  title: 'high_score'.tr,
                  subTitle: _board.score.toString(),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() => const SettingScreen());
                  },
                  child: Container(
                    padding: EdgeInsets.all(5.w),
                    decoration: BoxDecoration(
                        color: const Color(0xffcdc1b4),
                        borderRadius: BorderRadius.circular(5.r)),
                    child: Icon(
                      Icons.settings,
                      size: 25.sp,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                InkWell(
                  onTap: () {
                    constants.showDialog(
                        'restart'.tr, 'are_you_sure_to_restart'.tr, () {
                      newGame();
                      Get.back();
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(5.w),
                    decoration: BoxDecoration(
                        color: const Color(0xffcdc1b4),
                        borderRadius: BorderRadius.circular(5.r)),
                    child: Icon(
                      Icons.restart_alt,
                      size: 25.sp,
                    ),
                  ),
                ),
                SizedBox(
                  width: 25.w,
                ),
              ],
            )
          ],
        ),
        BoardWidget(
          moveLeft: () => setState(() => _board.moveLeft()),
          moveRight: () => setState(() => _board.moveRight()),
          moveUp: () => setState(() => _board.moveUp()),
          moveDown: () => setState(() => _board.moveDown()),
          children: children,
        ),
      ],
    );
  }
}
