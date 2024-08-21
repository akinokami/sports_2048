import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/tile.dart';
import '../../utils/colors.dart';
import '../../utils/query_data.dart';

class TileFiveWidget extends StatelessWidget {
  const TileFiveWidget({Key? key, required this.tile}) : super(key: key);
  final Tile tile;

  @override
  Widget build(BuildContext context) {
    int tileValue = tile.value;
    int digitsCount = tile.value.toString().length;
    return Container(
      width: tileSize5 - 4.0 * 2,
      height: tileSize5 - 4.0 * 2,
      decoration: BoxDecoration(
        color: tileColors[tile.value],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          (tileValue == 0) ? '' : tileValue.toString(),
          style: TextStyle(
            fontSize: (digitsCount == 4)
                ? 18.sp
                : (digitsCount == 3)
                    ? 26.sp
                    : (digitsCount == 2)
                        ? 36.sp
                        : 46.sp,
            fontWeight: FontWeight.bold,
            color: (tileValue <= 4) ? const Color(0xff776e65) : Colors.white,
          ),
        ),
      ),
    );
  }
}
