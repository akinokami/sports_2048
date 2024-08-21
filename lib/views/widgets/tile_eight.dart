import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/tile.dart';
import '../../utils/colors.dart';
import '../../utils/query_data.dart';

class TileEightWidget extends StatelessWidget {
  const TileEightWidget({Key? key, required this.tile}) : super(key: key);
  final Tile tile;

  @override
  Widget build(BuildContext context) {
    int tileValue = tile.value;
    int digitsCount = tile.value.toString().length;
    return Container(
      width: tileSize8 - 2.5 * 2,
      height: tileSize8 - 2.5 * 2,
      decoration: BoxDecoration(
        color: tileColors[tile.value],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          (tileValue == 0) ? '' : tileValue.toString(),
          style: TextStyle(
            fontSize: (digitsCount == 4)
                ? 14.sp
                : (digitsCount == 3)
                    ? 17.sp
                    : (digitsCount == 2)
                        ? 23.sp
                        : 30.sp,
            fontWeight: FontWeight.bold,
            color: (tileValue <= 4) ? const Color(0xff776e65) : Colors.white,
          ),
        ),
      ),
    );
  }
}
