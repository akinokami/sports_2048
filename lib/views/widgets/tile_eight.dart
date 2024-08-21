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
      child: Stack(
        children: [
          Center(
            child: (tileValue == 2)
                ? Icon(
                    Icons.sports_soccer,
                    color: Colors.grey.withOpacity(0.2),
                    size: 38.sp,
                  )
                : (tileValue == 4)
                    ? Icon(
                        Icons.sports_basketball,
                        color: Colors.grey.withOpacity(0.2),
                        size: 38.sp,
                      )
                    : (tileValue == 8)
                        ? Icon(
                            Icons.sports_football,
                            color: Colors.grey.withOpacity(0.2),
                            size: 38.sp,
                          )
                        : (tileValue == 16)
                            ? Icon(
                                Icons.sports_tennis,
                                color: Colors.white.withOpacity(0.2),
                                size: 38.sp,
                              )
                            : (tileValue == 32)
                                ? Icon(
                                    Icons.sports_hockey,
                                    color: Colors.white.withOpacity(0.2),
                                    size: 38.sp,
                                  )
                                : (tileValue == 64)
                                    ? Icon(
                                        Icons.sports_cricket,
                                        color: Colors.white.withOpacity(0.2),
                                        size: 38.sp,
                                      )
                                    : (tileValue == 128)
                                        ? Icon(
                                            Icons.sports_rugby,
                                            color:
                                                Colors.white.withOpacity(0.3),
                                            size: 38.sp,
                                          )
                                        : (tileValue == 256)
                                            ? Icon(
                                                Icons.sports_mma,
                                                color: Colors.white
                                                    .withOpacity(0.2),
                                                size: 38.sp,
                                              )
                                            : (tileValue == 512)
                                                ? Icon(
                                                    Icons.sports_volleyball,
                                                    color: Colors.white
                                                        .withOpacity(0.2),
                                                    size: 38.sp,
                                                  )
                                                : (tileValue == 1024)
                                                    ? Icon(
                                                        Icons.sports_baseball,
                                                        color: Colors.white
                                                            .withOpacity(0.2),
                                                        size: 38.sp,
                                                      )
                                                    : (tileValue == 2048)
                                                        ? Icon(
                                                            Icons.sports_golf,
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.2),
                                                            size: 38.sp,
                                                          )
                                                        : Container(),
          ),
          Center(
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
                color:
                    (tileValue <= 4) ? const Color(0xff776e65) : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
