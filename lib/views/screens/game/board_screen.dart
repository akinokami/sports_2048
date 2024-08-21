import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sports_2048/models/board.dart';
import 'package:sports_2048/utils/colors.dart';
import 'package:sports_2048/utils/constants.dart';
import 'package:sports_2048/utils/query_data.dart';
import 'package:sports_2048/views/screens/setting/setting_screen.dart';
import 'package:sports_2048/views/widgets/board.dart';
import 'package:sports_2048/views/widgets/custom_text.dart';
import 'package:sports_2048/views/widgets/tile.dart';
import 'package:sports_2048/views/widgets/toggle.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({Key? key}) : super(key: key);

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  late Board _board;
  late int _row;
  late int _column;

  @override
  void initState() {
    super.initState();
    _row = 4;
    _column = 4;
    _board = Board(_row, _column);

    newGame();
  }

  void newGame() {
    setState(() {
      _board.initBoard();
    });
  }

  Iterable<Widget> getRenderedTiles() {
    List<List<Widget>> tileWidgets = List.generate(4, (row) {
      return List.generate(4, (column) {
        return Positioned(
          top: row * tileSize,
          left: column * tileSize,
          width: tileSize,
          height: tileSize,
          child: Center(child: TileWidget(tile: _board.getTile(row, column))),
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
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     SizedBox(
            //       width: toggleWidth,
            //       height: toggleHeight,
            //       child: ElevatedButton(
            //         onPressed: () {},
            //         child: Text(
            //           'Undo',
            //         ),
            //         style: ButtonStyle(
            //           backgroundColor: MaterialStateProperty.all(
            //             const Color(0xff8f7a66),
            //           ),
            //         ),
            //       ),
            //     ),
            //     SizedBox(
            //       width: toggleWidth,
            //       height: toggleHeight,
            //       child: ElevatedButton(
            //         onPressed: () => newGame(),
            //         child: Text(
            //           'New Game',
            //         ),
            //         style: ButtonStyle(
            //           backgroundColor: MaterialStateProperty.all(
            //             const Color(0xff8f7a66),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
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
