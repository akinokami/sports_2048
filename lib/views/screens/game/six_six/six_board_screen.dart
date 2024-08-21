import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sports_2048/models/board_six.dart';
import 'package:sports_2048/services/local_storage.dart';
import 'package:sports_2048/utils/colors.dart';
import 'package:sports_2048/utils/constants.dart';
import 'package:sports_2048/utils/query_data.dart';
import 'package:sports_2048/views/screens/setting/setting_screen.dart';
import 'package:sports_2048/views/widgets/board.dart';
import 'package:sports_2048/views/widgets/custom_text.dart';
import 'package:sports_2048/views/widgets/tile_six.dart';
import 'package:sports_2048/views/widgets/toggle.dart';

class SixBoardScreen extends StatefulWidget {
  const SixBoardScreen({Key? key}) : super(key: key);

  @override
  State<SixBoardScreen> createState() => _SixBoardScreenState();
}

class _SixBoardScreenState extends State<SixBoardScreen> {
  late BoardSix _board;
  late int _row;
  late int _column;
  int highScore = 0;

  @override
  void initState() {
    super.initState();
    _row = 6;
    _column = 6;
    highScore = LocalStorage.instance.read(six) ?? 0;
    _board = BoardSix(_row, _column, highScore);
    newGame();
  }

  void newGame() {
    setState(() {
      _board.initBoard();
    });
  }

  Iterable<Widget> getRenderedTiles() {
    List<List<Widget>> tileWidgets = List.generate(6, (row) {
      return List.generate(6, (column) {
        return Positioned(
          top: row * tileSize6,
          left: column * tileSize6,
          width: tileSize6,
          height: tileSize6,
          child:
              Center(child: TileSixWidget(tile: _board.getTile(row, column))),
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
              CustomText(
                text: _board.gameOver()
                    ? 'game_over'.tr
                    : _board.gameVictory()
                        ? 'victory'.tr
                        : '',
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomText(
                text: _board.gameOver()
                    ? 'press_restart_to_start'.tr
                    : _board.gameVictory()
                        ? 'win_game'.tr
                        : '',
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth >= 600) {
            return Column(
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
                    Container(
                      width: 1.sw * 0.35,
                      padding: EdgeInsets.all(5.w),
                      decoration: BoxDecoration(
                          color: const Color(0xffcdc1b4),
                          borderRadius: BorderRadius.circular(5.r)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'score'.tr,
                            fontWeight: FontWeight.bold,
                          ),
                          CustomText(
                            text: _board.score.toString(),
                            size: 10.sp,
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 1.sw * 0.35,
                      padding: EdgeInsets.all(5.w),
                      decoration: BoxDecoration(
                          color: const Color(0xffcdc1b4),
                          borderRadius: BorderRadius.circular(5.r)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'high_score'.tr,
                            fontWeight: FontWeight.bold,
                          ),
                          CustomText(
                            text: _board.highScore.toString(),
                            size: 10.sp,
                          )
                        ],
                      ),
                    ),
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
                  ],
                ),
              ],
            );
          }
          return Column(
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
                    subTitle: _board.highScore.toString(),
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
          );
        }),
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
